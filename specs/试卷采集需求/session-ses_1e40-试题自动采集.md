# 试卷采集需求分析规划

**Session ID:** ses_1e40d6774ffeJhlW0S298ZpOaE
**Created:** 5/12/2026, 7:29:04 PM
**Updated:** 5/13/2026, 2:44:37 AM

---

## Assistant

**Tool: write**

---

## Assistant

计划已保存到 `.sisyphus/plans/poct-exam-collector.md`。以下是摘要：

---

## 📋 POCT 试卷采集系统 — 计划摘要

### 三层管线架构

```
📡 采集层           📝 提取层            💾 存储层
─────────          ─────────           ─────────
国内: DrissionPage  HTML解析器          JSONL
国际: Crawlee+      PDF解析器    →      SQLite
     Playwright     清洗去重
```

### 4 个 Phase

| Phase | 内容 | 预估 |
|-------|------|------|
| **1** 基础设施 | 项目骨架、配置、数据模型、存储层、CLI | ~5h |
| **2** 采集层 | 国内+国际采集器，反爬策略，增量采集 | ~10-15h |
| **3** 解析存储 | HTML/PDF 解析，清洗，导出 JSONL+SQLite | ~10h |
| **4** 题目生成 | LLM 管线（后续迭代，暂不实施） | 预留 |

### 关键决策（已确认）

- ✅ 尽可能多的网站采集
- ✅ 先采集已有试卷，生成放后续
- ✅ 输出 JSONL + SQLite

### 最大未知

需求文档太简略，最大的不确定性是 **具体采集哪些网站**。需要 Phase 0 做一次 POCT 考试资源的实际调研，确认每个站点的可用性和反爬强度。

---

需要我调用 Momus 审查这个计划吗？或者你有需要调整的地方？

---

## User

好的，可以做调研

---

## Assistant

好的，开始做 POCT 试卷资源的实际调研。并行搜索国内外多个渠道，同时用浏览器验证几个高优先级站点。

**Tool: task**

**Tool: task**

**Tool: task**

---

## Assistant

**Tool: websearch_web_search_exa**

**Tool: websearch_web_search_exa**

**Tool: websearch_web_search_exa**

**Tool: websearch_web_search_exa**

**Tool: grep_app_searchGitHub**

---

## Assistant

各个平台的实际内容非常有价值。等待后台调研完成后汇总。

**Tool: background_output**

**Tool: background_output**

**Tool: background_output**

---

## Assistant

**Tool: webfetch**

**Tool: webfetch**

**Tool: grep_app_searchGitHub**

**Tool: grep_app_searchGitHub**

---

## Assistant

**Tool: grep_app_searchGitHub**

**Tool: grep_app_searchGitHub**

**Tool: grep_app_searchGitHub**

**Tool: webfetch**

---

## Assistant

**Tool: webfetch**

**Tool: webfetch**

**Tool: webfetch**

---

## User

<system-reminder>
[BACKGROUND TASK COMPLETED]
**ID:** `bg_08f0b232`
**Description:** Find POCT exam resources online
**Duration:** 2m 14s

**2 tasks still in progress.** You WILL be notified when ALL complete.
Do NOT poll - continue productive work.

Use `background_output(task_id="bg_08f0b232")` to retrieve this result when ready.
</system-reminder>
<!-- OMO_INTERNAL_INITIATOR -->

---

## Assistant

**Tool: background_output**

---

## Assistant

Excellent - the librarian delivered a comprehensive GO/NO-GO assessment. Let me verify a few GitHub repos while waiting for the remaining background tasks.

**Tool: webfetch**

**Tool: webfetch**

---

## Assistant

**Tool: background_output**

**Tool: background_output**

---

## Assistant

调研数据已经非常充足了。让我汇总所有发现，撰写最终调研报告。

**Tool: background_cancel**

**Tool: background_cancel**

---

## Assistant

**Tool: read**

---

## Assistant

Now let me update the plan with verified research findings.

**Tool: edit**

---

## Assistant

Now let me update the implementation strategy based on findings — GitHub datasets are the biggest low-hanging fruit, so Phase 2 should be reordered.

**Tool: edit**

---

## Assistant

**Tool: edit**

---

## Assistant

---

## User

[analyze-mode]
ANALYSIS MODE. Gather context before diving deep:
CONTEXT GATHERING (parallel):
- 1-2 explore agents (codebase patterns, implementations)
- 1-2 librarian agents (if external library involved)
- Direct tools: Grep, AST-grep, LSP for targeted searches

IF COMPLEX - DO NOT STRUGGLE ALONE. Consult specialists:
- **Oracle**: Conventional problems (architecture, debugging, complex logic)
- **Artistry**: Non-conventional problems (different approach needed)

SYNTHESIZE findings before proceeding.
---
MANDATORY delegate_task params: ALWAYS include load_skills=[] and run_in_background when calling delegate_task.
Example: delegate_task(subagent_type="explore", prompt="...", run_in_background=true, load_skills=[])

---

分析可用网站就可以了，采集数据不要去实现，现在采集数据不是我们本来的目的，访问不了的网站可以通过http代理 http://127.0.0.1:8118 访问做测试了解有哪些网站可以访问就可以了，主要先实现代码及实现功能

---

## Assistant

明确了。先做两件事：1) 用代理测试网站可访问性，2) 然后实现代码框架（采集器、解析器、存储层的骨架），不做实际数据采集。

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

---

## Assistant

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

**Tool: bash**

---

## User

国内网站不需要走代理

---

## Assistant

**Tool: todowrite**

---

## Assistant

先把骨架搭起来，然后并行 delegate 各模块实现。

**Tool: todowrite**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: write**

**Tool: write**

---

## User

感觉你应该用现成代码来搭基础程序，不应该自己来写，从开源库取代码，然后完成其他功能就可以了

---

## Assistant

你说得对，需求文档明确写了"使用开源的现成模块，通过github获取，不要自己做"。让我从 GitHub 找现成可用的项目来搭基础。

**Tool: task**

---

## Assistant

**Tool: bash**

**Tool: bash**

**Tool: bash**

---

## Assistant

**Tool: bash**

**Tool: bash**

**Tool: bash**

---

## Assistant

等 librarian 找到现成项目再继续。

**Tool: background_output**

---

## Assistant

**Tool: bash**

---

## User

<system-reminder>
[ALL BACKGROUND TASKS COMPLETE]

**Completed:**
- `bg_35bb8d89`: Find reusable scraper code on GitHub

Use `background_output(task_id="<id>")` to retrieve each result.
</system-reminder>
<!-- OMO_INTERNAL_INITIATOR -->

---

## Assistant

**Tool: background_output**

---

## Assistant

找到了几个可以直接用的现成项目。我克隆关键项目作为基础，然后搭 POCT 专用层。

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: read**

**Tool: read**

**Tool: read**

**Tool: read**

---

## Assistant

**Tool: read**

**Tool: read**

**Tool: read**

---

## Assistant

**Tool: read**

**Tool: read**

---

## Assistant

清楚架构了。OhYee 的 `book118/` 模块提供了 HTTP 请求、代理、线程池、图片下载→PDF 的完整基础。我在上面叠加文本提取、新采集器、解析层和存储层。

**Tool: todowrite**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: write**

**Tool: write**

**Tool: write**

---

## Assistant

**Tool: write**

**Tool: write**

**Tool: write**

---

## Assistant

Now let me delegate the collector and parser implementations in parallel.

**Tool: write**

---

## Assistant

**Tool: task**

**Tool: task**

**Tool: task**

---

## Assistant

**Tool: todowrite**

---

## Assistant

3 个子代理并行实现采集器、解析器和 CLI。等待完成后集成测试。

---

## User

<system-reminder>
[BACKGROUND TASK COMPLETED]
**ID:** `bg_3fd40c7b`
**Description:** Implement domestic collectors
**Duration:** 10m 11s

**2 tasks still in progress.** You WILL be notified when ALL complete.
Do NOT poll - continue productive work.

Use `background_output(task_id="bg_3fd40c7b")` to retrieve this result when ready.
</system-reminder>
<!-- OMO_INTERNAL_INITIATOR -->

---

## User

<system-reminder>
[BACKGROUND TASK COMPLETED]
**ID:** `bg_4bfaa16c`
**Description:** Implement international collectors
**Duration:** 16m 38s

**1 task still in progress.** You WILL be notified when ALL complete.
Do NOT poll - continue productive work.

Use `background_output(task_id="bg_4bfaa16c")` to retrieve this result when ready.
</system-reminder>
<!-- OMO_INTERNAL_INITIATOR -->

---

## User

<system-reminder>
[ALL BACKGROUND TASKS COMPLETE]

**Completed:**
- `bg_3fd40c7b`: Implement domestic collectors
- `bg_4bfaa16c`: Implement international collectors
- `bg_10c831b2`: Implement parsers + extractors + CLI

Use `background_output(task_id="<id>")` to retrieve each result.
</system-reminder>
<!-- OMO_INTERNAL_INITIATOR -->

---

## Assistant

全部完成。回收结果。

**Tool: background_output**

**Tool: background_output**

**Tool: background_output**

---

## Assistant

全部完成。验证代码并运行端到端测试。

**Tool: todowrite**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: lsp_diagnostics**

**Tool: lsp_diagnostics**

**Tool: lsp_diagnostics**

**Tool: lsp_diagnostics**

---

## Assistant

零错误。安装依赖并跑端到端测试。

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

依赖安装成功。运行端到端集成测试：用真实 URL 验证 book118 采集→解析→存储全流程。

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

**Tool: bash**

**Tool: bash**

---

## Assistant

book118 和 renrendoc 都返回 200 且包含完整题目文本。现在跑完整端到端测试。

**Tool: bash**

---

## Assistant

提取了 225 个问题块但处理超时。让我分步调试优化性能。

**Tool: bash**

---

## Assistant

发现解析质量问题——题目切分太激进。修复 `split_into_questions` 的正则和过滤逻辑。

**Tool: read**

---

## Assistant

**Tool: read**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: read**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: read**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: bash**

---

## Assistant

需要让 renrendoc 采集器用共享的 `extractors` 模块。let me update it.

**Tool: read**

---

## Assistant

**Tool: write**

---

## Assistant

**Tool: read**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

关键问题：文本是连续的，没有换行。修复 section 和 question 匹配模式。

**Tool: edit**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: bash**

---

## Assistant

62 个有效问题块，分割质量好了。跑完整端到端流程。

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

**Tool: bash**

---

## Assistant

端到端流程跑通了！清理测试数据，完成集成测试。

**Tool: bash**

---

## Assistant

**Tool: lsp_diagnostics**

---

## Assistant

**Tool: read**

---

## Assistant

**Tool: edit**

---

## Assistant

**Tool: lsp_diagnostics**

---

## Assistant

**Tool: todowrite**

---

## Assistant

**Tool: bash**

---

## Assistant

---

## ✅ 完成总结

### 项目架构

基于 **OhYee/documentDownloader**（MIT 许可）搭建，30 个 Python 文件，3116 行代码。

```
poct-exam-collector/
├── book118/           # ← OhYee 现成代码（MIT）：HTTP请求、代理、线程池、图片→PDF
├── collectors/
│   ├── base.py        # BaseCollector：get() / get_soup() / 重试 / 限速 / 代理
│   ├── domestic/      # renrendoc, book118_text, wenjuan, wszg8
│   └── international/ # quizplus, examlex, ncbi
├── extractors/
│   └── document_extractor.py  # HTML→文本 / 题目切分（section+编号识别）
├── parsers/
│   └── question_parser.py     # 文本→结构化题目（题型检测/选项/答案/解析）
├── storage/
│   └── repository.py          # SQLite + JSONL 双存储
├── config.py          # pydantic-settings + YAML
├── models.py          # SQLAlchemy ORM（Question + Source）
├── cli.py             # Typer CLI：collect / parse / export / stats / test
└── config.yaml        # 7 个国内源 + 5 个国际源 + 5 个 GitHub 数据集
```

### 网站验证结果

| 来源 | 可访问 | 代码实现 |
|------|--------|---------|
| renrendoc.com | ✅ (200, 不含代理) | RenrendocCollector |
| book118.com | ✅ (200, 含完整文本预览) | Book118TextCollector |
| wenjuan.com | ✅ (200) | WenjuanCollector |
| wszg8.com | ✅ (200) | Wszg8Collector |
| quizplus.com | ✅ (200, 需代理) | QuizplusCollector |
| examlex.com | ✅ (200, 需代理) | ExamlexCollector |
| NCBI StatPearls | ✅ (200, 需代理) | NCBICollector |
| LabCE | ❌ (403) | disabled |
| Quizlet | ❌ (403) | disabled |

### 集成测试验证

```bash
poct-collect collect --site renrendoc --url "https://www.renrendoc.com/paper/520752720.html"
# → 采集 62 个文本块 → 解析出 61 道题目 → SQLite + JSONL 双存储 ✅
poct-collect stats  # → 按站点/题型统计 ✅
poct-collect export --format jsonl  # → 导出 JSONL ✅
```

**LSP**: 新代码 0 error（仅 book118/ 原有 4 个 pre-existing type hints 问题）

### 下一步

计划文件已更新：`.sisyphus/plans/poct-exam-collector.md`（含完整调研结果和可访问 URL 清单）

---

