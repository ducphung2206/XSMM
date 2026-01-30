"""
XSMM RAG Export Script
Export dữ liệu XSMM sang định dạng tối ưu cho AI RAG integration
"""
import json
from pathlib import Path
from datetime import datetime

def load_xsmm_data():
    """Load merged XSMM data"""
    data_file = Path(__file__).parent / "xsmm-complete.json"
    with open(data_file, "r", encoding="utf-8") as f:
        return json.load(f)

def export_rag_documents(data):
    """
    Export dạng documents - mỗi work item là 1 document
    Phù hợp cho: LangChain, LlamaIndex, vector databases
    """
    documents = []
    
    for cat in data["categories"]:
        for wt in cat.get("work_types", []):
            for wi in wt.get("work_items", []):
                # Tạo document text tối ưu cho embedding
                doc_text = f"""Công việc: {wi['name']}
Mã: {wi['code']}
Đơn vị: {wi.get('unit', 'N/A')}
Phân loại: {cat['name']} > {wt['name']}
Mô tả: {wi.get('description', '')}
Cách đo lường: {wi.get('measurement_method', '')}
Công thức: {wi.get('formula', '')}"""
                
                doc = {
                    "id": wi["code"],
                    "text": doc_text,
                    "metadata": {
                        "code": wi["code"],
                        "name": wi["name"],
                        "unit": wi.get("unit", ""),
                        "category_code": cat["code"],
                        "category_name": cat["name"],
                        "work_type_code": wt["code"],
                        "work_type_name": wt["name"],
                        "formula": wi.get("formula", ""),
                        "source": "XSMM - Xhome SG"
                    }
                }
                documents.append(doc)
    
    return documents

def export_rag_chunks(data):
    """
    Export dạng chunks nhỏ hơn - tối ưu cho embedding
    Mỗi chunk ~200-500 tokens
    """
    chunks = []
    
    # Chunk 1: Category overview chunks
    for cat in data["categories"]:
        work_types_list = ", ".join([wt["name"] for wt in cat.get("work_types", [])])
        chunk = {
            "id": f"cat-{cat['code']}",
            "type": "category_overview",
            "text": f"Danh mục {cat['code']}: {cat['name']}. Bao gồm các loại công việc: {work_types_list}",
            "metadata": {
                "category_code": cat["code"],
                "category_name": cat["name"]
            }
        }
        chunks.append(chunk)
    
    # Chunk 2: Work item chunks
    for cat in data["categories"]:
        for wt in cat.get("work_types", []):
            for wi in wt.get("work_items", []):
                chunk = {
                    "id": f"wi-{wi['code']}",
                    "type": "work_item",
                    "text": f"{wi['name']} (mã {wi['code']}, đơn vị: {wi.get('unit', 'N/A')}). {wi.get('description', '')} Cách đo: {wi.get('measurement_method', '')}. Công thức: {wi.get('formula', '')}",
                    "metadata": {
                        "code": wi["code"],
                        "name": wi["name"],
                        "unit": wi.get("unit", ""),
                        "category": cat["name"],
                        "work_type": wt["name"],
                        "formula": wi.get("formula", "")
                    }
                }
                chunks.append(chunk)
    
    return chunks

def export_qa_pairs(data):
    """
    Export dạng Q&A pairs - tối ưu cho fine-tuning
    """
    qa_pairs = []
    
    for cat in data["categories"]:
        for wt in cat.get("work_types", []):
            for wi in wt.get("work_items", []):
                # Q1: Đơn vị tính
                qa_pairs.append({
                    "question": f"Đơn vị tính của công việc {wi['name']} là gì?",
                    "answer": f"Đơn vị tính của {wi['name']} (mã {wi['code']}) là {wi.get('unit', 'chưa xác định')}."
                })
                
                # Q2: Cách đo lường
                if wi.get("measurement_method"):
                    qa_pairs.append({
                        "question": f"Cách đo lường khối lượng {wi['name']} như thế nào?",
                        "answer": f"Để đo khối lượng {wi['name']}: {wi['measurement_method']}"
                    })
                
                # Q3: Công thức
                if wi.get("formula"):
                    qa_pairs.append({
                        "question": f"Công thức tính khối lượng {wi['name']} là gì?",
                        "answer": f"Công thức: {wi['formula']}"
                    })
                
                # Q4: Mã công việc
                qa_pairs.append({
                    "question": f"Mã công việc của {wi['name']} là gì?", 
                    "answer": f"Mã công việc: {wi['code']} (thuộc {cat['name']} > {wt['name']})"
                })
    
    return qa_pairs

def export_jsonl_for_embeddings(data):
    """
    Export JSONL format cho vector database (Pinecone, Weaviate, Qdrant...)
    """
    lines = []
    
    for cat in data["categories"]:
        for wt in cat.get("work_types", []):
            for wi in wt.get("work_items", []):
                record = {
                    "id": wi["code"].replace(".", "_"),
                    "text": f"{wi['name']}. {wi.get('description', '')} Đơn vị: {wi.get('unit', '')}. {wi.get('measurement_method', '')}",
                    "metadata": {
                        "code": wi["code"],
                        "name": wi["name"],
                        "unit": wi.get("unit", ""),
                        "category": cat["name"],
                        "work_type": wt["name"]
                    }
                }
                lines.append(json.dumps(record, ensure_ascii=False))
    
    return "\n".join(lines)

def main():
    print("XSMM RAG Export Tool")
    print("=" * 50)
    
    # Load data
    data = load_xsmm_data()
    print(f"Loaded: {data['stats']['total_work_items']} work items")
    
    output_dir = Path(__file__).parent / "rag_export"
    output_dir.mkdir(exist_ok=True)
    
    # Export 1: RAG Documents
    docs = export_rag_documents(data)
    with open(output_dir / "xsmm-rag-documents.json", "w", encoding="utf-8") as f:
        json.dump({
            "version": "1.0",
            "exported_at": datetime.now().isoformat(),
            "total_documents": len(docs),
            "documents": docs
        }, f, ensure_ascii=False, indent=2)
    print(f"✅ RAG Documents: {len(docs)} docs → rag_export/xsmm-rag-documents.json")
    
    # Export 2: RAG Chunks
    chunks = export_rag_chunks(data)
    with open(output_dir / "xsmm-rag-chunks.json", "w", encoding="utf-8") as f:
        json.dump({
            "version": "1.0",
            "exported_at": datetime.now().isoformat(),
            "total_chunks": len(chunks),
            "chunks": chunks
        }, f, ensure_ascii=False, indent=2)
    print(f"✅ RAG Chunks: {len(chunks)} chunks → rag_export/xsmm-rag-chunks.json")
    
    # Export 3: Q&A Pairs
    qa = export_qa_pairs(data)
    with open(output_dir / "xsmm-qa-pairs.json", "w", encoding="utf-8") as f:
        json.dump({
            "version": "1.0",
            "exported_at": datetime.now().isoformat(),
            "total_pairs": len(qa),
            "qa_pairs": qa
        }, f, ensure_ascii=False, indent=2)
    print(f"✅ Q&A Pairs: {len(qa)} pairs → rag_export/xsmm-qa-pairs.json")
    
    # Export 4: JSONL for embeddings
    jsonl = export_jsonl_for_embeddings(data)
    with open(output_dir / "xsmm-embeddings.jsonl", "w", encoding="utf-8") as f:
        f.write(jsonl)
    print(f"✅ JSONL: {len(jsonl.splitlines())} records → rag_export/xsmm-embeddings.jsonl")
    
    print("\n" + "=" * 50)
    print("Export completed! Files ready for:")
    print("  • LangChain / LlamaIndex (xsmm-rag-documents.json)")
    print("  • Vector DBs: Pinecone, Weaviate, Qdrant (xsmm-embeddings.jsonl)")
    print("  • Fine-tuning (xsmm-qa-pairs.json)")

if __name__ == "__main__":
    main()
