"""
XSMM Copilot - xlwings Bridge
Excel 2019 integration with FastAPI backend

Installation:
1. pip install xlwings requests
2. xlwings addin install
3. Open Excel, enable XSMM Add-in
4. Use Ctrl+Alt+X to open Copilot panel
"""
import json
import requests
from typing import Optional, Dict, List, Any
from functools import lru_cache

import xlwings as xw

# ============================================
# Configuration
# ============================================

API_BASE_URL = "http://localhost:8000/api/v1"
TIMEOUT = 30  # seconds


class XSMMCopilot:
    """
    XSMM Copilot Bridge for Excel
    Connects Excel 2019 to FastAPI backend via xlwings
    """
    
    def __init__(self, api_url: str = API_BASE_URL):
        self.api_url = api_url
        self._session = requests.Session()
    
    def _request(self, method: str, endpoint: str, **kwargs) -> Dict:
        """Make HTTP request to API"""
        url = f"{self.api_url}{endpoint}"
        try:
            response = self._session.request(
                method, 
                url, 
                timeout=TIMEOUT,
                **kwargs
            )
            response.raise_for_status()
            return response.json()
        except requests.exceptions.ConnectionError:
            return {"error": "Không thể kết nối API. Chạy: docker compose up -d"}
        except requests.exceptions.Timeout:
            return {"error": "Request timeout"}
        except Exception as e:
            return {"error": str(e)}
    
    # ============================================
    # Work Items API
    # ============================================
    
    def search_work_items(self, query: str, limit: int = 20) -> List[Dict]:
        """Tìm kiếm công tác theo tên hoặc mã"""
        result = self._request("GET", f"/work-items/search/?q={query}&limit={limit}")
        if "error" in result:
            return []
        return result
    
    def get_work_item(self, code: str) -> Optional[Dict]:
        """Lấy thông tin công tác theo mã"""
        result = self._request("GET", f"/work-items/{code}")
        if "error" in result:
            return None
        return result
    
    def list_work_items_by_category(self, category_code: str) -> List[Dict]:
        """Lấy danh sách công tác theo danh mục"""
        result = self._request("GET", f"/work-items/by-category/{category_code}")
        if "error" in result:
            return []
        return result
    
    # ============================================
    # Materials API
    # ============================================
    
    def search_materials(self, query: str, limit: int = 20) -> List[Dict]:
        """Tìm kiếm vật liệu"""
        result = self._request("GET", f"/materials/search/?q={query}&limit={limit}")
        if "error" in result:
            return []
        return result
    
    def get_material(self, material_id: str) -> Optional[Dict]:
        """Lấy thông tin vật liệu"""
        result = self._request("GET", f"/materials/{material_id}")
        if "error" in result:
            return None
        return result
    
    # ============================================
    # Labor Rates API
    # ============================================
    
    def get_labor_rates(self, work_item_code: str, region: str = "HCM") -> List[Dict]:
        """Lấy đơn giá nhân công cho công tác"""
        result = self._request(
            "GET", 
            f"/labor-rates/by-work-item/{work_item_code}?region={region}"
        )
        if "error" in result:
            return []
        return result
    
    def compare_rates(self, work_item_code: str, region: str = "HCM") -> Dict:
        """So sánh đơn giá từ các nhà thầu"""
        result = self._request(
            "GET",
            f"/labor-rates/compare?work_item_code={work_item_code}&region={region}"
        )
        return result
    
    # ============================================
    # AI Copilot API
    # ============================================
    
    def chat(
        self, 
        message: str, 
        history: List[Dict] = None,
        context: Dict = None
    ) -> Dict:
        """Chat với AI Copilot"""
        payload = {
            "message": message,
            "history": history or [],
            "context": context or {},
        }
        result = self._request("POST", "/copilot/chat", json=payload)
        return result
    
    def quick_lookup(self, code: str) -> Dict:
        """Tra cứu nhanh mã XSMM"""
        result = self._request("GET", f"/copilot/lookup/{code}")
        return result
    
    def calculate(
        self, 
        work_item_code: str, 
        dimensions: Dict
    ) -> Dict:
        """Tính khối lượng"""
        result = self._request(
            "POST",
            f"/copilot/calculate?work_item_code={work_item_code}",
            json=dimensions
        )
        return result
    
    def get_suggestions(self, query: str, limit: int = 10) -> List[Dict]:
        """Lấy gợi ý autocomplete"""
        result = self._request("GET", f"/copilot/suggestions?query={query}&limit={limit}")
        if "error" in result:
            return []
        return result.get("results", [])


# ============================================
# Excel Functions (xlwings UDFs)
# ============================================

# Global copilot instance
_copilot = XSMMCopilot()


@xw.func
@xw.arg('query', doc='Từ khóa tìm kiếm')
@xw.ret(expand='table')
def xsmm_search(query: str) -> List[List]:
    """
    Tìm kiếm công tác XSMM
    
    Sử dụng: =xsmm_search("sơn tường")
    Returns: Table [Mã | Tên | Đơn vị]
    """
    items = _copilot.search_work_items(query, limit=20)
    
    if not items:
        return [["Không tìm thấy kết quả"]]
    
    # Header
    result = [["Mã", "Tên công tác", "Đơn vị"]]
    
    # Data rows
    for item in items:
        result.append([
            item.get("code", ""),
            item.get("name", ""),
            item.get("unit", ""),
        ])
    
    return result


@xw.func
@xw.arg('code', doc='Mã XSMM (vd: CT.04.01.01)')
@xw.ret(expand='table')
def xsmm_lookup(code: str) -> List[List]:
    """
    Tra cứu công tác theo mã
    
    Sử dụng: =xsmm_lookup("CT.04.01.01")
    Returns: Thông tin chi tiết + đơn giá
    """
    result = _copilot.quick_lookup(code)
    
    if "error" in result:
        return [[result["error"]]]
    
    output = [
        ["Mã", result.get("code", "")],
        ["Tên", result.get("name", "")],
        ["Đơn vị", result.get("unit", "")],
        ["Cách đo", result.get("measurement_method", "")],
        ["Công thức", result.get("formula", "")],
    ]
    
    # Add labor rates
    rates = result.get("labor_rates", [])
    if rates:
        output.append(["", ""])
        output.append(["--- Đơn giá nhân công ---", ""])
        for rate in rates:
            output.append([
                rate.get("contractor", "Unknown"),
                f"{rate.get('rate', 0):,.0f} VND/{rate.get('unit', '')}"
            ])
    
    return output


@xw.func
@xw.arg('code', doc='Mã XSMM')
@xw.arg('region', doc='Khu vực (mặc định: HCM)')
@xw.ret(expand='table')
def xsmm_rates(code: str, region: str = "HCM") -> List[List]:
    """
    So sánh đơn giá nhân công
    
    Sử dụng: =xsmm_rates("CT.07.01.01", "HCM")
    Returns: Bảng so sánh giá từ các nhà thầu
    """
    result = _copilot.compare_rates(code, region)
    
    if "error" in result:
        return [[result["error"]]]
    
    rates = result.get("rates", [])
    
    if not rates:
        return [["Chưa có dữ liệu đơn giá"]]
    
    # Header
    output = [["Nhà thầu", "Đơn giá", "Đơn vị", "Rating", "Bao VL"]]
    
    # Data rows
    for rate in rates:
        output.append([
            rate.get("contractor_name", "Unknown"),
            f"{rate.get('rate_per_unit', 0):,.0f}",
            rate.get("unit", ""),
            rate.get("contractor_rating", "-"),
            "Có" if rate.get("includes_material") else "Không",
        ])
    
    # Recommendation
    rec = result.get("recommendation", {})
    if rec:
        output.append(["", "", "", "", ""])
        output.append([
            f"→ Gợi ý: {rec.get('contractor', '')}",
            f"{rec.get('rate', 0):,.0f}",
            "",
            rec.get("reason", ""),
            "",
        ])
    
    return output


@xw.func
@xw.arg('code', doc='Mã XSMM')
@xw.arg('length', doc='Chiều dài (m)')
@xw.arg('width', doc='Chiều rộng (m)')
@xw.arg('height', doc='Chiều cao/dày (m), mặc định 0')
def xsmm_calc(
    code: str, 
    length: float, 
    width: float, 
    height: float = 0
) -> str:
    """
    Tính khối lượng công tác
    
    Sử dụng: =xsmm_calc("CT.04.01.01", 10, 5, 0.2)
    Returns: "14.4 m³ (Bê tông móng băng)"
    """
    dimensions = {
        "length": length,
        "width": width,
    }
    
    if height > 0:
        dimensions["height"] = height
    
    result = _copilot.calculate(code, dimensions)
    
    if "error" in result:
        return result["error"]
    
    quantity = result.get("quantity", 0)
    work_item = result.get("work_item", {})
    unit = work_item.get("unit", "")
    name = work_item.get("name", "")
    
    return f"{quantity} {unit} ({name})"


@xw.func  
@xw.arg('query', doc='Từ khóa tìm kiếm')
@xw.ret(expand='table')
def xsmm_materials(query: str) -> List[List]:
    """
    Tìm kiếm vật liệu
    
    Sử dụng: =xsmm_materials("gạch 600")
    Returns: Table [Tên | Brand | Đơn vị | Giá]
    """
    items = _copilot.search_materials(query, limit=20)
    
    if not items:
        return [["Không tìm thấy kết quả"]]
    
    # Header
    result = [["Tên sản phẩm", "Thương hiệu", "Đơn vị", "Giá tham khảo"]]
    
    # Data rows
    for item in items:
        price = item.get("base_price") or item.get("current_price")
        result.append([
            item.get("name", ""),
            item.get("brand", "-"),
            item.get("unit", ""),
            f"{price:,.0f}" if price else "-",
        ])
    
    return result


# ============================================
# Excel Sub Procedures
# ============================================

@xw.sub
def show_copilot():
    """
    Mở cửa sổ chat AI Copilot
    Sử dụng: Macro hoặc button click
    """
    import webbrowser
    webbrowser.open("http://localhost:3000")


@xw.sub
def insert_work_item():
    """
    Insert công tác vào vị trí con trỏ
    Hiển thị dialog để chọn công tác
    """
    wb = xw.Book.caller()
    sheet = wb.sheets.active
    selection = sheet.range(xw.apps.active.selection.address)
    
    # Get user input
    import tkinter as tk
    from tkinter import simpledialog
    
    root = tk.Tk()
    root.withdraw()
    
    query = simpledialog.askstring(
        "XSMM Copilot", 
        "Nhập từ khóa tìm công tác:",
        parent=root
    )
    
    if not query:
        return
    
    # Search
    items = _copilot.search_work_items(query, limit=10)
    
    if not items:
        tk.messagebox.showinfo("XSMM Copilot", "Không tìm thấy kết quả")
        return
    
    # Show selection dialog
    root = tk.Tk()
    root.title("Chọn công tác")
    root.geometry("600x400")
    
    listbox = tk.Listbox(root, font=("Consolas", 10), width=80, height=15)
    for item in items:
        listbox.insert(tk.END, f"[{item['code']}] {item['name']} ({item['unit']})")
    listbox.pack(pady=10)
    
    selected_item = [None]
    
    def on_select():
        idx = listbox.curselection()
        if idx:
            selected_item[0] = items[idx[0]]
        root.destroy()
    
    btn = tk.Button(root, text="Chọn", command=on_select, width=20)
    btn.pack(pady=5)
    
    root.mainloop()
    
    # Insert to Excel
    if selected_item[0]:
        item = selected_item[0]
        # Assuming BOQ table format: Description | Unit | Quantity | Rate | Total
        selection.value = item["name"]
        selection.offset(0, 1).value = item["unit"]


@xw.sub
def refresh_prices():
    """
    Cập nhật đơn giá trong sheet hiện tại
    Tìm các ô có mã XSMM và cập nhật giá mới nhất
    """
    wb = xw.Book.caller()
    sheet = wb.sheets.active
    
    # Find cells with XSMM codes (pattern: CT.XX.XX.XX)
    import re
    pattern = r'CT\.\d{2}\.\d{2}\.\d{2}'
    
    used_range = sheet.used_range
    updated = 0
    
    for cell in used_range:
        if cell.value and isinstance(cell.value, str):
            match = re.search(pattern, cell.value)
            if match:
                code = match.group()
                rates = _copilot.get_labor_rates(code)
                
                if rates:
                    # Find minimum rate and update next column
                    min_rate = min(r.get("rate_per_unit", 0) for r in rates)
                    # Assuming rate column is 2 columns to the right
                    cell.offset(0, 2).value = min_rate
                    updated += 1
    
    if updated > 0:
        import tkinter.messagebox as mb
        mb.showinfo("XSMM Copilot", f"Đã cập nhật {updated} đơn giá")


# ============================================
# Main (for testing)
# ============================================

if __name__ == "__main__":
    # Test API connection
    copilot = XSMMCopilot()
    
    print("Testing XSMM Copilot Bridge...")
    print("-" * 40)
    
    # Test search
    print("\n1. Search 'bê tông':")
    items = copilot.search_work_items("bê tông", limit=3)
    for item in items:
        print(f"  [{item['code']}] {item['name']}")
    
    # Test lookup
    if items:
        code = items[0]["code"]
        print(f"\n2. Lookup '{code}':")
        info = copilot.quick_lookup(code)
        print(f"  Name: {info.get('name')}")
        print(f"  Unit: {info.get('unit')}")
    
    # Test AI chat
    print("\n3. AI Chat:")
    response = copilot.chat("Tính khối lượng bê tông móng băng 0.4x0.8m dài 20m")
    print(f"  Response: {response.get('message', 'No response')[:200]}...")
    
    print("\n" + "-" * 40)
    print("✓ Bridge test completed!")
