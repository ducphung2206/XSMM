"""
XSMM Data Import Script for Supabase
Import dữ liệu từ xsmm-complete.json vào Supabase
"""
import json
import os
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Config
SUPABASE_URL = os.getenv("SUPABASE_URL", "YOUR_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_KEY", "YOUR_SERVICE_KEY")

def load_xsmm_data():
    """Load merged XSMM data"""
    data_file = Path(__file__).parent.parent / "data" / "xsmm-complete.json"
    with open(data_file, "r", encoding="utf-8") as f:
        return json.load(f)

def generate_insert_sql(data):
    """Generate SQL INSERT statements from XSMM data"""
    sql_lines = []
    sql_lines.append("-- XSMM Data Import Script")
    sql_lines.append("-- Generated from xsmm-complete.json")
    sql_lines.append("")
    sql_lines.append("BEGIN;")
    sql_lines.append("")
    
    # Insert Categories
    sql_lines.append("-- ============================================")
    sql_lines.append("-- INSERT CATEGORIES")
    sql_lines.append("-- ============================================")
    
    for idx, cat in enumerate(data["categories"]):
        code = cat["code"]
        name = cat["name"].replace("'", "''")
        desc = cat.get("description", "").replace("'", "''")
        
        sql_lines.append(f"""
INSERT INTO categories (code, name, description, sort_order)
VALUES ('{code}', '{name}', '{desc}', {idx + 1})
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
""".strip())
    
    sql_lines.append("")
    sql_lines.append("-- ============================================")
    sql_lines.append("-- INSERT WORK TYPES")
    sql_lines.append("-- ============================================")
    
    # Insert Work Types
    for cat in data["categories"]:
        cat_code = cat["code"]
        for idx, wt in enumerate(cat.get("work_types", [])):
            wt_code = wt["code"]
            wt_name = wt["name"].replace("'", "''")
            wt_desc = wt.get("description", "").replace("'", "''")
            
            sql_lines.append(f"""
INSERT INTO work_types (category_id, code, name, description, sort_order)
SELECT c.id, '{wt_code}', '{wt_name}', '{wt_desc}', {idx + 1}
FROM categories c WHERE c.code = '{cat_code}'
ON CONFLICT (code) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description;
""".strip())
    
    sql_lines.append("")
    sql_lines.append("-- ============================================")
    sql_lines.append("-- INSERT WORK ITEMS")
    sql_lines.append("-- ============================================")
    
    # Insert Work Items
    for cat in data["categories"]:
        for wt in cat.get("work_types", []):
            wt_code = wt["code"]
            for idx, wi in enumerate(wt.get("work_items", [])):
                wi_code = wi["code"]
                wi_name = wi["name"].replace("'", "''")
                wi_unit = wi.get("unit", "").replace("'", "''")
                wi_desc = wi.get("description", "").replace("'", "''")
                wi_method = wi.get("measurement_method", "").replace("'", "''")
                wi_formula = wi.get("formula", "").replace("'", "''")
                
                # Handle rules
                rules = wi.get("rules", {})
                inclusion = json.dumps(rules.get("inclusion", []), ensure_ascii=False).replace("'", "''")
                exclusion = json.dumps(rules.get("exclusion", []), ensure_ascii=False).replace("'", "''")
                
                sql_lines.append(f"""
INSERT INTO work_items (work_type_id, code, name, unit, description, measurement_method, formula, inclusion_rules, exclusion_rules, sort_order)
SELECT wt.id, '{wi_code}', '{wi_name}', '{wi_unit}', '{wi_desc}', '{wi_method}', '{wi_formula}', '{inclusion}'::jsonb, '{exclusion}'::jsonb, {idx + 1}
FROM work_types wt WHERE wt.code = '{wt_code}'
ON CONFLICT (code) DO UPDATE SET 
    name = EXCLUDED.name, 
    unit = EXCLUDED.unit,
    description = EXCLUDED.description,
    measurement_method = EXCLUDED.measurement_method,
    formula = EXCLUDED.formula;
""".strip())
    
    sql_lines.append("")
    sql_lines.append("COMMIT;")
    sql_lines.append("")
    sql_lines.append("-- Verify counts")
    sql_lines.append("SELECT 'categories' as table_name, COUNT(*) as count FROM categories")
    sql_lines.append("UNION ALL")
    sql_lines.append("SELECT 'work_types', COUNT(*) FROM work_types")
    sql_lines.append("UNION ALL")
    sql_lines.append("SELECT 'work_items', COUNT(*) FROM work_items;")
    
    return "\n".join(sql_lines)

def import_with_supabase_client(data):
    """Import using Supabase Python client (alternative method)"""
    try:
        from supabase import create_client, Client
        
        supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
        
        # Insert categories
        for idx, cat in enumerate(data["categories"]):
            cat_result = supabase.table("categories").upsert({
                "code": cat["code"],
                "name": cat["name"],
                "description": cat.get("description", ""),
                "sort_order": idx + 1
            }, on_conflict="code").execute()
            
            cat_id = cat_result.data[0]["id"]
            
            # Insert work types
            for wt_idx, wt in enumerate(cat.get("work_types", [])):
                wt_result = supabase.table("work_types").upsert({
                    "category_id": cat_id,
                    "code": wt["code"],
                    "name": wt["name"],
                    "description": wt.get("description", ""),
                    "sort_order": wt_idx + 1
                }, on_conflict="code").execute()
                
                wt_id = wt_result.data[0]["id"]
                
                # Insert work items
                for wi_idx, wi in enumerate(wt.get("work_items", [])):
                    rules = wi.get("rules", {})
                    supabase.table("work_items").upsert({
                        "work_type_id": wt_id,
                        "code": wi["code"],
                        "name": wi["name"],
                        "unit": wi.get("unit", ""),
                        "description": wi.get("description", ""),
                        "measurement_method": wi.get("measurement_method", ""),
                        "formula": wi.get("formula", ""),
                        "inclusion_rules": rules.get("inclusion", []),
                        "exclusion_rules": rules.get("exclusion", []),
                        "sort_order": wi_idx + 1
                    }, on_conflict="code").execute()
        
        print("✅ Import completed successfully!")
        return True
        
    except ImportError:
        print("❌ supabase-py not installed. Run: pip install supabase")
        return False
    except Exception as e:
        print(f"❌ Error: {e}")
        return False

def main():
    print("XSMM Data Import Tool")
    print("=" * 40)
    
    # Load data
    data = load_xsmm_data()
    print(f"Loaded: {data['stats']['total_categories']} categories, {data['stats']['total_work_items']} work items")
    
    # Generate SQL
    sql = generate_insert_sql(data)
    
    # Save SQL file
    output_file = Path(__file__).parent / "seed_data.sql"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(sql)
    
    print(f"✅ Generated SQL: {output_file}")
    print("\nTo import:")
    print("1. Run schema.sql in Supabase SQL Editor first")
    print("2. Then run seed_data.sql to import data")
    print("\nOr use Supabase Python client:")
    print("  pip install supabase python-dotenv")
    print("  Set SUPABASE_URL and SUPABASE_SERVICE_KEY in .env")
    print("  Run: python import_data.py --client")

if __name__ == "__main__":
    import sys
    if "--client" in sys.argv:
        data = load_xsmm_data()
        import_with_supabase_client(data)
    else:
        main()
