"""
XSMM Data Merge Script
Merge tất cả category JSON files thành 1 file database-ready
"""
import json
import os
from pathlib import Path

def merge_xsmm_data():
    base_dir = Path(__file__).parent
    categories_dir = base_dir / "categories"
    
    # Load category 1 từ xsmm-data.json
    with open(base_dir / "xsmm-data.json", "r", encoding="utf-8") as f:
        main_data = json.load(f)
    
    all_categories = main_data.get("categories", [])
    
    # Load tất cả category files
    category_files = sorted(categories_dir.glob("cat-*.json"))
    
    for cat_file in category_files:
        with open(cat_file, "r", encoding="utf-8") as f:
            cat_data = json.load(f)
            all_categories.append(cat_data)
    
    # Sort by code
    all_categories.sort(key=lambda x: int(x["code"]))
    
    # Count totals
    total_work_types = 0
    total_work_items = 0
    
    for cat in all_categories:
        work_types = cat.get("work_types", [])
        total_work_types += len(work_types)
        for wt in work_types:
            total_work_items += len(wt.get("work_items", []))
    
    # Build merged data
    merged_data = {
        "version": "1.0",
        "created_at": "2026-01-30",
        "author": "Alex (AI Assistant) - Xhome Sài Gòn",
        "description": "XSMM - Chuẩn hóa phương pháp bóc khối lượng",
        "stats": {
            "total_categories": len(all_categories),
            "total_work_types": total_work_types,
            "total_work_items": total_work_items
        },
        "categories": all_categories
    }
    
    # Write merged file
    output_file = base_dir / "xsmm-complete.json"
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(merged_data, f, ensure_ascii=False, indent=2)
    
    print(f"✅ Merged successfully!")
    print(f"   Categories: {len(all_categories)}")
    print(f"   Work Types: {total_work_types}")
    print(f"   Work Items: {total_work_items}")
    print(f"   Output: {output_file}")
    
    return merged_data

if __name__ == "__main__":
    merge_xsmm_data()
