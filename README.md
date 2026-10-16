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
├── scripts/                          # Optional automation utilities
│   └── Sync-ObsidianLesson.ps1       # PowerShell transcript-to-Obsidian stream utility
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

Open the corresponding file inside `Lessons/<topic-name>.md` in Obsidian side-by-side to watch your structured lesson note grow in real time.

---

## How a Session Works: `Ground → Probe → Plan → Teach`

Whenever you ask to learn something, the agent runs a strict four-phase loop that integrates directly with Obsidian and **Smart Connections**:

### Phase 0: Ground (Semantic Vault Discovery)
- Automatically queries your Obsidian vault and Smart Connections (`scripts/Find-RelatedNotes.ps1`) to find 1–3 semantically closest prior lessons.
- Extracts their bedrock principles and determines conceptual bridges or cross-domain isomorphisms so you never learn in isolation.

### Phase 1: Probe (Diagnostic Calibration)
- Anchors to the related notes discovered in Phase 0 to establish the floor of what you already accept.
- Uses Antigravity's interactive `ask_question` UI modal to binary-search the exact edge of your current knowledge.
- Distractors are **diagnostic**—each wrong choice maps to a specific misconception.
- Includes an automatic *"I don't know"* option so you never have to guess blindly.
- Clarifies your exact learning goal before planning.

### Phase 2: Plan (Dependency Graph)
- Dispatches the `researcher` subagent if any formula, historical claim, or edge case needs verification.
- Identifies the **Unconditional Truths** at the root of the topic.
- Draws a **Mermaid Dependency Map** (`graph TD`) anchoring onto prior vault notes (`[[Prior Note]]`) and showing how root axioms flow into derived concepts and your target goal, and waits for your approval before teaching.

### Phase 3: Teach (Node-by-Node Append Loop)
- Steps through the dependency graph one node at a time:
  1. **Motivate**: Why do we need this step right now?
  2. **Establish**: Derive the concept Socratically or expositorily.
  3. **Connect**: Tie it explicitly to the prior foundation using cross-disciplinary analogies and reciprocal Obsidian `[[wikilinks]]`.
  4. **Verify**: Check comprehension with a quick diagnostic quiz and log graded feedback (`> [!success] Correct ✓` or `> [!failure] Incorrect ✗`).
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
