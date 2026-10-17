# Antigravity Learning Assistant

A self-contained **Socratic AI Learning Vault** adapted for **Google Antigravity** and **Obsidian**, based on Amos Blomqvist's framework from [*How I Use AI to Learn Things*](https://www.youtube.com/watch?v=kzcI5F4tGiU).

Instead of passive walls of text that fade from memory, this system builds a durable **dependency graph of knowledge** inside your head—and mirrors every step live into an interactive Obsidian note with native Callouts, LaTeX math, Mermaid architecture maps, and verified geometric diagrams.

---

## Core Philosophy

Memorized facts rot because they sit in isolation. **Understood facts** persist because they are held in place by their connections to foundational truths you already accept.

Every explanation and lesson in this workspace enforces two non-negotiable principles:

1. **Principle I — Unconditional Truths First (Nodes)**
   Start from the bedrock. Lock in the core, always-true, caveat-free facts before introducing anything derived on top of them. The brain commits immediately to facts it knows are safe from future contradiction.
2. **Principle II — Motivated Discovery ("How Could I Have Discovered This?") (Edges)**
   Never decree a formula or mechanism out of nowhere. Every step starts from the motivating problem so that each idea feels *discovered*, not memorized.

---

## Repository Structure (Self-Contained Learning Vault)

This repository is designed to be opened **simultaneously** as a workspace in **Google Antigravity** and as a Vault in **Obsidian**:

```text
learn/
├── .agents/                          # Native Antigravity customization root
│   ├── agents/                       # Specialized subagents
│   │   ├── researcher.md             # Web verification subagent (prevents hallucinations)
│   │   ├── mermaid-maker.md          # Relational & dependency diagram author
│   │   └── svg-maker.md              # Exact coordinate & geometric SVG author
│   └── skills/                       # Progressive-disclosure skills
│       ├── teach/
│       │   └── SKILL.md              # The 3-phase Socratic teaching engine
│       └── visualize/
│           └── SKILL.md              # Visual composition & verification rules
│
├── Lessons/                          # Live Obsidian lesson notes (append-only)
│   └── .gitkeep
│
├── viz/                              # Generated SVG/PNG visual assets for lessons
│   └── .gitkeep
│
├── scripts/                          # Automation utilities
│   ├── Find-RelatedNotes.ps1         # Semantic vault & Smart Connections lookup
│   ├── Open-ObsidianNote.ps1         # Auto-focuses new lesson notes in Obsidian via URI
│   └── Sync-ObsidianLesson.ps1       # PowerShell transcript-to-Obsidian stream utility
│
├── .obsidian/                        # Pre-configured Obsidian vault settings & plugins
│   ├── snippets/
│   │   └── wide-lessons.css          # Full-width note & responsive Mermaid styling
│   └── plugins/
│       └── antigravity-cli-sidebar/  # Embedded CLI + auto-popup listener for new lessons
│
├── assets/                           # Repository media
│   └── thumbnail.png
│
├── GEMINI.md                         # Master project rules loaded automatically by Antigravity
├── .gitignore                        # Configured for Obsidian + Antigravity
└── README.md
```

---

## Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/learn.git
cd learn
```

### 2. Open as an Obsidian Vault
1. Launch **Obsidian**.
2. Click **Open folder as vault** and select the cloned `learn` folder.
3. *(Optional)* In Obsidian **Settings → Files and links**, ensure *Automatically update internal links* is enabled. Obsidian supports LaTeX (`$...$`), Callouts (`> [!abstract]`), Mermaid diagrams, and `![[viz-...]]` embeds out of the box—no community plugins required.

### 3. Open in Google Antigravity
1. Open the `learn` folder as your active workspace in **Google Antigravity**.
2. Antigravity automatically discovers `GEMINI.md`, `.agents/skills/`, and `.agents/agents/`.

### 4. Start Learning
Ask Antigravity to teach you any concept, from a quick question to an entire field:
> *"Teach me how TCP congestion control works from first principles."*
> *"Help me genuinely understand eigenvectors and why they matter."*
> *"Walk me through how transformers compute attention."*

When a new lesson starts, `Lessons/<topic-name>.md` automatically pops up as your active tab in Obsidian so you can watch your structured lesson note grow in real time.

---

## How a Session Works: `Ground → Probe → Plan → Teach`

Whenever you ask to learn something, the agent runs a strict four-phase loop that integrates directly with Obsidian and **Smart Connections**:

### Phase 0: Ground (Semantic Vault Discovery)
- Automatically queries your Obsidian vault and Smart Connections (`scripts/Find-RelatedNotes.ps1`) to find 1–3 semantically closest prior lessons.
- Extracts their bedrock principles and determines conceptual bridges or cross-domain isomorphisms so you never learn in isolation.

### Phase 1: Probe (Multi-Turn Binary Search Calibration)
- Immediately initializes `Lessons/<topic-name>.md` and **pops it up as the active tab in Obsidian** (`scripts/Open-ObsidianNote.ps1` + vault create listener).
- **Plots every question and its numbered options directly onto the Obsidian note *before* you answer**, in the same step as invoking Antigravity's interactive `ask_question` UI modal, so you can read the LaTeX-rendered question and choices in Obsidian while selecting your answer.
- **Multi-Turn Binary Search (3–6 Adaptive Questions)**: Asks one diagnostic question per turn, escalating difficulty sharply when you answer correctly and narrowing in when you miss or select *"I don't know"*, until both your **floor** and **ceiling** are bracketed across every prerequisite strand.
- **Bare-Claim Diagnostic Distractors**: Every option is constructed as a parallel bare claim (zero inline *"because..."* giveaways) where each distractor maps to a specific misconception.
- Clarifies your exact learning goal before planning.

### Phase 2: Plan (Dependency Graph)
- Dispatches the `researcher` subagent to map the topic's genuine first principles and verify formulas/claims.
- Identifies the **Unconditional Truths** at the root of the topic and stress-tests that they aren't disguised mid-level theorems.
- Draws a **Mermaid Dependency Map** (`graph TD`) anchoring onto prior vault notes (`[[Prior Note]]`) and showing how root axioms flow into derived concepts and your target goal, and waits for your approval before teaching.

### Phase 3: Teach (Multi-Block Node-by-Node Append Loop)
- Steps through the dependency graph one node at a time using a rich **5-block structure per node**:
  1. **Block 1 — Motivate** (`> [!abstract] Why We Need This Now`): What concrete problem or limitation forces us down this path right now?
  2. **Block 2 — Establish the Foundation** (`> [!abstract] Unconditional Truth`): State the caveat-free truth or universal atomic unit (*"ALL X is done through {____}"*).
  3. **Block 3 — Motivated Derivation & Deep Theory** (`> [!abstract] Step-by-Step Derivation & Intuition`): 3Blue1Brown-style step-by-step derivation, motivating every algebraic/logical move with examples and diagrams.
  4. **Block 4 — Connect to the Graph** (`> [!tip] Connecting the Graph & Vault Isomorphisms`): Tie the node explicitly to prior nodes and `[[Prior Note]]` wikilinks, highlighting "the click".
  5. **Block 5 — Plot Quiz & Verify** (`> [!question] Quiz — Node N Check`): Plots the quiz to Obsidian *as* `ask_question` opens, then immediately logs graded feedback (`> [!success] Quiz — correct ✓`, `> [!failure] Quiz — incorrect ✗`, or `> [!question] Quiz — I don't know`), repairing the node with a dedicated Repair Block if missed.
- **Append-Only Guarantee**: The agent never overwrites your active lesson file (`Append: true` only). Obsidian updates smoothly at the bottom without scroll-jumping or erasing personal notes you type along the way.

---

## Saving Your Personal Notes to Git (Optional)

By default, `.gitignore` keeps the repository clean as a template by ignoring files generated inside `Lessons/` and `viz/` (while keeping the folders themselves via `.gitkeep`).

If you are using this repository as your **personal study backup** (e.g., in a private GitHub repository) and want Git to track all your lessons and diagrams, simply comment out or remove these lines in `.gitignore`:

```gitignore
# Comment these out to track your personal lessons & visuals in Git:
# Lessons/*
# !Lessons/.gitkeep
# viz/*
# !viz/.gitkeep
```

---

## Credits & Inspiration

- **Original Concept & Pedagogy**: [Amos Blomqvist](https://github.com/amosblomqvist/learn) — [*How I Use AI to Learn Things*](https://www.youtube.com/watch?v=kzcI5F4tGiU).
- **Antigravity & Obsidian Adaptation**: Re-architected around Google Antigravity's native customization engine (`.agents/`, `GEMINI.md`, `ask_question`, and subagents) and Obsidian's native Markdown/LaTeX/Mermaid vault ecosystem.
