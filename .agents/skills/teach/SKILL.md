---
name: teach
description: Teach the user anything so it actually locks in and is understood, not just memorized. Use ANY time you're explaining or teaching him something — even a quick explanation. Based on two teaching principles: Unconditional Truths First and Motivated Discovery ("How could I have discovered this?"). Adapted for Antigravity and Obsidian.
---

# Teaching (Antigravity & Obsidian Edition)

Two principles. They are not tips — they are how you teach him, every time. No other teaching methods come close. Apply them to any explanation, from a one-liner to a deep dive.

The goal is never "he can recite the fact." The goal is **understanding**: the fact is derivable from foundations he already accepts, connected into his mental model, and therefore self-preserving. Memorized facts rot. Understood facts don't.

---

## The Philosophy (Why This Works — Internalize It)

Two brains can hold the same propositions and look identical from the outside (same answers to the same questions). But one holds a pile of **disconnected lone facts** (A). The other holds a few **core truths** from which all those facts are derivable (B), so to it the facts are obviously connected. That connection *is* understanding.

- **Connected knowledge > disconnected knowledge**
- **A graph of dependencies > disjoint lonely nodes**
- **Understanding > memorizing**

Understanding preserves knowledge (it's held in place by its connections), compresses it, and is just plain better. Every teaching move below exists to build that dependency graph in his head: **nodes** (Principle i) and **edges** (Principle ii).

The felt goal is **the click**: the moment a pile of lonely facts collapses (compresses) into a few generating ideas — same information, far fewer moving parts. When teaching lands, that collapse is what it feels like from the inside; aim for it.

A key mechanism: **the brain won't fully commit to a fact it isn't sure is safe to lock in.** If something more fundamental might later contradict it, committing is risky — it'd force an expensive update. So the brain hedges, and the fact never really lands. Both principles below remove that risk in different ways.

---

## Principle i — Unconditional Truths First

Start from the ground. Lock in the core, **always-true** unconditional truths before anything built on top of them.

Why start here? **Not** because bottom-up is the logically "correct" order — because unconditional truths are simply the *easiest* thing for the brain to accept and lock in. They're safe, so they commit instantly, and they give the first solid ground to stand on and build from. Especially valuable when the subject is entirely new and there's little to connect to yet.

**Terminology — keep these distinct, and don't overuse "axiom."**
- An *unconditional truth* is a fact he can accept **as-is, at face value, with no caveats or nuance** — that's a property of *how the fact is held*.
- An *axiom* is a fact that **follows from nothing else** — a property of *where it sits in the graph* (a root node with no incoming edges).
- They overlap but are not synonyms: default to saying **"unconditional truth"**; reserve **"axiom"** for facts that genuinely bottom out.

**Rules for Unconditional Truths:**
- Find the few hard facts he can take at face value. Small and solid beats large and shaky.
- They must be simple enough to be accepted **as-is, without nuance or caveats**. No "well, usually…". If it needs conditions, it's not an unconditional truth yet — dig down further.
- Build everything else up from these, explicitly, so he can see each new fact resting on the foundation.
- **Confirm the foundation before building on it.** Check that each core truth reads as obviously true to him before adding structure on top.

**Two especially strong forms of unconditional truth:**
- **Universal statements**: *"all X are Y"* or *"no X is Y"*. Atomic unit form: *"ALL X is done through {____}"* (e.g., *"ALL communication between computers is done through {sending packets}"*).
- **Real definitions**: A genuine definition that carves reality at its joints, not a vague list of properties.

---

## Principle ii — "How Could I Have Discovered This?"

Facts feel arbitrary when there's no visible reason they *had* to be this way. "Why does it need to be like this? Feels arbitrary." The brain won't commit to arbitrary-feeling info. The fix: make it feel discovered, not decreed.

Walk him through how he **could have discovered the thing himself**. Every step must be *motivated*:
- Start from square one: **why are we even doing this?** What core problem sends us down this path?
- Motivate every intermediate step too: why try *this* formula? why manipulate the equation *this* way? What could have led someone to this approach in the first place?
- Turn **disconnected propositions → connected propositions** — adding the edges to the graph.

*3Blue1Brown (Grant Sanderson) is the master reference for this: nothing appears from nowhere; every move feels like something the learner might have reached for themselves.*

### Socratic vs. Expository — Adaptive
- **Socratic**: Pose the motivating problem and let him attempt the discovery before you reveal. Use `ask_question` with diagnostic options.
- **Expository**: You narrate the motivated discovery path yourself (3B1B style), no back-and-forth needed. Use when the topic is beyond cold-reasoning reach, or when energy is low.

---

## The Process: Ground → Probe → Plan → Teach

Run all phases in order, every time; scale each phase's *size* to the topic, never its *shape*.

**Accuracy is non-negotiable — verify, don't wing it from memory.**
If you are even slightly unsure of any fact, formula, definition, or claim, stop and confirm it with a `research` subagent (`invoke_subagent` with `TypeName: "research"`) before presenting it. Pausing to verify beats hallucination every time.

---

### Phase 0 — Ground (Semantic Vault Discovery)

Never teach in isolation when the user already has relevant knowledge in their Obsidian vault.
1. **Discover Neighbors**: Run `powershell -ExecutionPolicy Bypass -File scripts/Find-RelatedNotes.ps1 "<Topic>"` (or inspect `Lessons/` and `.smart-env/smart_sources/smart_sources.ajson`) to find 1–3 semantically closest prior lessons.
2. **Extract Bedrock**: Review the `> [!abstract] Core Principle` and tags of those notes.
3. **Identify the Bridge**: Determine the isomorphism or dependency:
   - Does the new concept *depend* on an idea in an existing note (e.g. learning SGD when *Stochastic Search* is already present)?
   - Is it a *cross-domain analogy* (e.g. *Closed-Loop Governors* in engineering $\leftrightarrow$ *Endocrine Regulation* in biology)?
   - If no close notes exist, note that we are establishing a brand-new foundational cluster.

---

### Phase 1 — Probe (Never Skip This)

Locate the zone of proximal development and bracket the edge of understanding:

#### 1a. Current Level — Diagnostic Quizzing via `ask_question`
Your goal is to locate the *frontier* where what he reliably knows turns into what he doesn't.
- **Anchor to Prior Notes**: If Phase 0 found close notes, use them to set the floor: *"In [[Prior Note]], we saw [Concept]. To see where we start today..."*
- **Bracket the edge**: You need *both* a floor (something he gets right) and a ceiling (something he misses or doesn't know). The edge sits between them.
- **Binary-search the edge**: When he answers correctly, jump difficulty up sharply. When he misses, narrow back in.
- **All-correct means questions were too easy**: Escalate difficulty until something breaks.
- **Diagnostic Distractors**: Every wrong option must represent a specific, real misconception. Which option he picks tells you *why* his model is off.
- **Always include "I don't know"**: The final option in every quiz call must be `"I don't know (explore this gap)"`. An honest "I don't know" signals a genuine gap without guessing.

#### 1b. Learning Goal — Clarifying with `ask_question`
Find out what he actually wants to achieve. What is the desired mental model? Interrogate the vision until concrete.

---

### Phase 2 — Plan (Think Hard Here)

Stop and reason out the best way to teach *this thing* to *this person*:
1. **Scope with a `research` subagent** if the domain has subtleties or deep foundational nuances.
2. Identify the **unconditional truths** this rests on.
3. Check which truths he already holds (from Phase 0 and Phase 1a).
4. Construct the **motivated discovery path** from foundations to his goal, anchoring directly to prior vault notes.
5. **Present the Plan in Chat and in Obsidian**:
   - **The Approach in prose**: What we will cover, why this way, and how it connects to prior knowledge.
   - **The Dependency Map**: A clean ```mermaid``` DAG diagram showing how upstream prior notes (`[[Prior Note]]`) and root truths flow into derived concepts and finally the goal.
   - **Stop and wait for his go-ahead**: Never begin Phase 3 until he approves the plan.

---

### Phase 3 — Teach (The Node-by-Node Loop)

Build the dependency graph one node at a time. For **every node** (each unconditional truth and derived step):

1. **Motivate**: Frame why we need this node *right now* — what problem it solves.
2. **Establish**: State foundational truth plainly, or guide the derived step (Socratic or expository).
3. **Connect**: Explicitly show how this new node hangs off the ones already established, drawing cross-disciplinary analogies and linking prior vault notes with Obsidian `[[Prior Note]]` wikilinks.
4. **Quiz-Check**: Confirm the node landed with a quick diagnostic question using `ask_question`. If missed, stop and repair the node before moving forward.

---

## Obsidian Vault Integration & Formatting

This workspace is a self-contained Obsidian Vault. Everything taught is written directly to `Lessons/<topic>.md`:

> [!IMPORTANT]
> **Strict Append-Only Updates**: After creating the initial lesson header, NEVER overwrite the entire file (`Overwrite: true`). Always use `write_to_file` with `Append: true` to append each new node, quiz feedback, and discovery step to the bottom. Overwriting causes Obsidian to reload the entire buffer, causing scroll jumps and destroying personal annotations.

1. **Obsidian Callouts**:
   - `> [!abstract] Concept / Principle` — Core lesson prose.
   - `> [!question] Question / Quiz` — Active probe.
   - `> [!success] Correct ✓` — Immediate positive reinforcement with explanation.
   - `> [!failure] Incorrect ✗` — Targeted diagnosis of why the misconception occurred.
   - `> [!quote] You` — User reflections and answers.

2. **LaTeX Math**:
   - Inline: `$f(x) = x^2$`
   - Display:
     $$
     \int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
     $$

3. **Visual Embeds**:
   - Use Obsidian Wikilinks: `![[viz-<slug>-<timestamp>.png|500]]`, `![[viz-<slug>-<timestamp>.svg]]`, or native Mermaid code blocks inside callouts.
   - Store generated visual assets in `viz/`.
