"""
XSMM Copilot - AI Service
LangChain + Gemini integration for QS assistance
"""
import json
from typing import Optional, List, Dict, Any

from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain.schema import HumanMessage, AIMessage, SystemMessage
from langchain.tools import tool

from app.core.config import get_settings

settings = get_settings()


# ============================================
# XSMM Tools for AI Agent
# ============================================

class XSMMTools:
    """Tools for AI to interact with XSMM database"""
    
    def __init__(self, db_session):
        self.db = db_session
    
    async def search_work_items(self, query: str, limit: int = 5) -> List[Dict]:
        """Search XSMM work items by keyword"""
        from sqlalchemy import select
        from app.models.models import WorkItem
        
        stmt = (
            select(WorkItem)
            .where(
                WorkItem.name.ilike(f"%{query}%") |
                WorkItem.code.ilike(f"%{query}%")
            )
            .limit(limit)
        )
        
        result = await self.db.execute(stmt)
        items = result.scalars().all()
        
        return [
            {
                "code": item.code,
                "name": item.name,
                "unit": item.unit,
                "measurement_method": item.measurement_method,
                "formula": item.formula,
            }
            for item in items
        ]
    
    async def get_labor_rates(self, work_item_code: str, region: str = "HCM") -> List[Dict]:
        """Get labor rates for a work item"""
        from sqlalchemy import select
        from app.models.models import LaborRate, Contractor
        
        stmt = (
            select(LaborRate, Contractor)
            .outerjoin(Contractor, LaborRate.contractor_id == Contractor.id)
            .where(
                LaborRate.work_item_code == work_item_code,
                LaborRate.region == region,
            )
            .order_by(LaborRate.rate_per_unit)
        )
        
        result = await self.db.execute(stmt)
        rows = result.all()
        
        return [
            {
                "contractor": contractor.name if contractor else "Unknown",
                "rate": float(rate.rate_per_unit),
                "unit": rate.unit,
                "includes_material": rate.includes_material,
            }
            for rate, contractor in rows
        ]
    
    async def search_materials(self, query: str, limit: int = 5) -> List[Dict]:
        """Search materials catalog"""
        from sqlalchemy import select
        from app.models.models import Material
        
        stmt = (
            select(Material)
            .where(
                Material.is_active == True,
                Material.name.ilike(f"%{query}%") |
                Material.brand.ilike(f"%{query}%") |
                Material.product_code.ilike(f"%{query}%")
            )
            .limit(limit)
        )
        
        result = await self.db.execute(stmt)
        materials = result.scalars().all()
        
        return [
            {
                "id": str(mat.id),
                "name": mat.name,
                "brand": mat.brand,
                "product_code": mat.product_code,
                "unit": mat.unit,
                "base_price": float(mat.base_price) if mat.base_price else None,
            }
            for mat in materials
        ]


# ============================================
# Copilot Service
# ============================================

class CopilotService:
    """AI Copilot for QS price estimation"""
    
    SYSTEM_PROMPT = """Bạn là XSMM Copilot - trợ lý AI chuyên hỗ trợ QS (Quantity Surveyor) tính giá thành xây dựng.

Vai trò của bạn:
1. Giúp QS bóc khối lượng công việc xây dựng
2. Tra cứu mã công việc XSMM (351 items)
3. Tìm kiếm và so sánh giá vật liệu
4. So sánh đơn giá nhân công từ các nhà thầu
5. Tính toán khối lượng và thành tiền

Quy tắc:
- Luôn trả lời bằng tiếng Việt
- Khi tính toán, show rõ công thức: V = L × W × H
- Đề xuất mã XSMM phù hợp khi user mô tả công việc
- So sánh giá từ nhiều nguồn nếu có
- Format số tiền: 1,234,567 VND

Khi user hỏi về công việc xây dựng, hãy:
1. Xác định mã XSMM tương ứng
2. Nêu đơn vị tính và cách đo
3. Gợi ý công thức tính (nếu có)
4. Tra giá tham khảo (nếu có trong database)
"""

    def __init__(self, db_session=None):
        self.db = db_session
        self.tools = XSMMTools(db_session) if db_session else None
        
        # Initialize Gemini
        if settings.gemini_api_key:
            self.llm = ChatGoogleGenerativeAI(
                model="gemini-2.0-flash",
                google_api_key=settings.gemini_api_key,
                temperature=0.3,
                convert_system_message_to_human=True,
            )
        else:
            self.llm = None
    
    async def chat(
        self,
        message: str,
        history: List[Dict] = None,
        context: Dict = None,
    ) -> Dict[str, Any]:
        """
        Process a chat message and return response with suggestions
        
        Args:
            message: User message
            history: Chat history [{"role": "user/assistant", "content": "..."}]
            context: Current Excel context (selected cell, etc.)
        
        Returns:
            {
                "message": "AI response",
                "suggestions": [...],
                "calculations": {...},
                "actions": [...]
            }
        """
        if not self.llm:
            return {
                "message": "⚠️ Gemini API key chưa được cấu hình. Vui lòng thêm GEMINI_API_KEY vào .env",
                "suggestions": [],
                "calculations": {},
                "actions": [],
            }
        
        # Build context string
        context_str = ""
        if context:
            context_str = f"\n\nContext từ Excel: {json.dumps(context, ensure_ascii=False)}"
        
        # Search for relevant data
        suggestions = []
        calculations = {}
        
        if self.db and self.tools:
            # Try to find relevant work items
            work_items = await self.tools.search_work_items(message)
            if work_items:
                suggestions.extend([
                    {"type": "work_item", **item} for item in work_items
                ])
            
            # If we found a work item, get labor rates
            if work_items:
                rates = await self.tools.get_labor_rates(work_items[0]["code"])
                if rates:
                    suggestions.extend([
                        {"type": "labor_rate", "work_item": work_items[0]["code"], **rate}
                        for rate in rates
                    ])
            
            # Search materials if relevant keywords
            material_keywords = ["gạch", "sơn", "xi măng", "thép", "gỗ", "vật liệu"]
            if any(kw in message.lower() for kw in material_keywords):
                materials = await self.tools.search_materials(message)
                suggestions.extend([
                    {"type": "material", **mat} for mat in materials
                ])
        
        # Build messages for LLM
        messages = [SystemMessage(content=self.SYSTEM_PROMPT)]
        
        # Add history
        if history:
            # Filter history to ensure we don't start with an AI message (validity check)
            # Gemini requires strict Human/AI turn-taking
            valid_history = []
            
            # If the first message is AI, skip it (likely a greeting)
            start_index = 0
            if history and history[0].get("role") == "assistant":
                 start_index = 1
            
            for msg in history[start_index:][-10:]:  # Last 10 messages from the valid start
                if msg["role"] == "user":
                    messages.append(HumanMessage(content=msg["content"]))
                else:
                    messages.append(AIMessage(content=msg["content"]))
        
        # Add current message with context
        user_message = message
        if suggestions:
            user_message += f"\n\n[Dữ liệu tham khảo từ database: {json.dumps(suggestions[:5], ensure_ascii=False)}]"
        if context_str:
            user_message += context_str
        
        messages.append(HumanMessage(content=user_message))
        
        # Get AI response
        try:
            response = await self.llm.ainvoke(messages)
            ai_message = response.content
        except Exception as e:
            ai_message = f"❌ Lỗi khi gọi Gemini API: {str(e)}"
        
        # Parse calculations from response (simple extraction)
        calculations = self._extract_calculations(ai_message)
        
        # Generate actions for Excel
        actions = self._generate_actions(suggestions, calculations)
        
        return {
            "message": ai_message,
            "suggestions": suggestions[:10],
            "calculations": calculations,
            "actions": actions,
        }
    
    def _extract_calculations(self, text: str) -> Dict:
        """Extract calculation results from AI response"""
        import re
        
        calculations = {}
        
        # Look for patterns like "= 14.4 m³" or "Kết quả: 1,234,567 VND"
        volume_match = re.search(r'=\s*([\d,.]+)\s*m[³3]', text)
        if volume_match:
            calculations["volume"] = volume_match.group(1)
        
        area_match = re.search(r'=\s*([\d,.]+)\s*m[²2]', text)
        if area_match:
            calculations["area"] = area_match.group(1)
        
        money_match = re.search(r'([\d,]+)\s*VND', text)
        if money_match:
            calculations["total"] = money_match.group(1)
        
        return calculations
    
    def _generate_actions(self, suggestions: List, calculations: Dict) -> List[Dict]:
        """Generate Excel actions based on suggestions and calculations"""
        actions = []
        
        # If we have a work item suggestion
        work_items = [s for s in suggestions if s.get("type") == "work_item"]
        if work_items:
            item = work_items[0]
            actions.append({
                "type": "insert_row",
                "data": {
                    "description": item["name"],
                    "unit": item["unit"],
                    "code": item["code"],
                }
            })
        
        # If we have calculations
        if calculations.get("volume"):
            actions.append({
                "type": "set_cell",
                "column": "quantity",
                "value": calculations["volume"],
            })
        
        if calculations.get("area"):
            actions.append({
                "type": "set_cell",
                "column": "quantity",
                "value": calculations["area"],
            })
        
        return actions
    
    async def quick_lookup(self, code: str) -> Dict:
        """Quick lookup a work item by code"""
        if not self.db or not self.tools:
            return {"error": "Database not connected"}
        
        from sqlalchemy import select
        from app.models.models import WorkItem
        
        stmt = select(WorkItem).where(WorkItem.code == code)
        result = await self.db.execute(stmt)
        item = result.scalar_one_or_none()
        
        if not item:
            return {"error": f"Work item {code} not found"}
        
        # Get labor rates
        rates = await self.tools.get_labor_rates(code)
        
        return {
            "code": item.code,
            "name": item.name,
            "unit": item.unit,
            "measurement_method": item.measurement_method,
            "formula": item.formula,
            "labor_rates": rates,
        }
