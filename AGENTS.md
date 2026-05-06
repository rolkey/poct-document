# document/ — Project Documentation

**Content:** Requirements, specs, ER diagrams, DB schemas, reference docs

## STRUCTURE
```
document/
├── 需求/                    # POCT platform requirements spec (docx)
│   ├── POCT 智慧管理平台需求规格说明书.docx
│   └── 质控模块说明书1.0.md
├── 原生文档/                # DB schemas, ERD, table structures
│   ├── lis_tables_pg.sql    # PostgreSQL DDL
│   ├── lis_erd.puml         # ER diagram (PlantUML)
│   └── 功能脑图.puml        # Feature mind map
├── 检验管理/                # Inspection management docs
├── 质控管理/                # QC management docs
├── 参考文档/                # Westgard rules, QC reference
└── 所有功能.puml            # Full feature PlantUML
```

## WHERE TO LOOK
| Task | Location |
|------|----------|
| Requirements | `需求/POCT 智慧管理平台需求规格说明书.docx` |
| QC module spec | `需求/质控模块说明书1.0.md` |
| DB schema (PostgreSQL) | `原生文档/lis_tables_pg.sql` |
| ER diagram | `原生文档/lis_erd.puml` |
| Feature mind map | `原生文档/功能脑图.puml` |
| Westgard rules | `参考文档/Westgard规则.md` |
