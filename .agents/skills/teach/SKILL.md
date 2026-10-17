---
name: teach
description: Teach the user anything so it actually locks in and is understood, not just memorized. Use ANY time you're explaining or teaching him something — even a quick explanation. Based on Amos Blomqvist's two teaching principles: Unconditional Truths First and Motivated Discovery ("How could I have discovered this?"). Adapted for Antigravity and Obsidian.
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
- They overlap but are not synonyms: an axiom that's also caveat-free is one kind of unconditional truth, but plenty of unconditional truths *do* derive from deeper things — they simply don't need that derivation to be safely accepted. Default to saying **"unconditional truth"**; reserve **"axiom"** for facts that genuinely bottom out. Don't call something an axiom just because it sounds foundational.

**Rules for Unconditional Truths:**
- Find the few hard facts he can take at face value — often first principles that don't depend on anything else, though they needn't be true roots. Small and solid beats large and shaky.
- They must be simple enough to be accepted **as-is, without nuance or caveats**. No "well, usually…". If it needs conditions, it's not an unconditional truth yet — dig down further.
- These can be committed to *instantly and safely*, because nothing more fundamental will come along to contradict them. That safety is what makes them lock in.
- Build everything else up from these, explicitly, so he can see each new fact resting on the foundation.
- **Confirm the foundation before building on it.** Briefly check that each core truth actually reads as obviously/unconditionally true to him before you add structure on top. If a core truth doesn't feel rock-solid, stop and fix the foundation — don't build on sand.

**Two especially strong forms of unconditional truth to reach for:**
- **Universal statements**: *"all X are Y"* or *"no X is Y"*. These are easy for the brain to lock in because they admit no exceptions to hedge against. A clean atomic-unit version (*"ALL X is done through {____}"*, e.g. *"ALL communication between computers is done through {sending packets}"*) is one particularly strong special case — surface it when a domain has one, but it's just one shape of universal statement, not the only one.
- **Real definitions**: A genuine definition that carves reality at its joints, not a vague list of properties dressed up as one. If it's just "things that tend to be true of X," it isn't a definition and won't anchor anything.

Don't force either where there isn't a clean one.

---

## Principle ii — "How Could I Have Discovered This?"

Facts feel arbitrary when there's no visible reason they *had* to be this way. "Why does it need to be like this? Feels arbitrary." The brain won't commit to arbitrary-feeling info. The fix: make it feel discovered, not decreed.

Walk him through how he **could have discovered the thing himself**. Every step must be *motivated*:
- Start from square one: **why are we even doing this?** What core problem sends us down this path?
- Motivate every intermediate step too: why try *this* formula? why manipulate the equation *this* way? What could have led someone to this approach in the first place?
- The output is turning **disconnected propositions → connected propositions** — adding the edges to the graph.

*3Blue1Brown (Grant Sanderson) is the master reference for this: nothing appears from nowhere; every move feels like something the learner might have reached for themselves.*

### Socratic vs. Expository — Adaptive
Choose per topic and per his apparent energy:
- **Socratic**: Pose the motivating problem and let him attempt the discovery before you reveal. More effortful, stronger locking-in. Default to this when he can plausibly reason his way there. Use `ask_question` with diagnostic options.
- **Expository**: You narrate the motivated discovery path yourself (3B1B style), no back-and-forth needed. Use when the topic is beyond cold-reasoning reach, or when he's low-energy / wants it delivered.

---

## Writing Quiz Options — A Construction Procedure (Applies to Every Quiz)

Don't write a good answer plus throwaway wrongs and audit afterwards; **build the options so evenness is automatic**:

1. **Every option is a bare claim — no justification anywhere.** The number-one giveaway is the correct option carrying its own reasoning (*"…, because it preserves X"*) while the distractors are bare, making it longer and more specific. Put *zero* "why" in any option; all reasoning goes in the graded feedback callout (`> [!success]` / `> [!failure]`), which only appears after he answers.
2. **Write the correct claim first, then mutate it into each distractor.** Take one specific misconception or easily-confused neighbour and state what someone holding it would claim — in the *same* skeleton, grain size, and register as the correct claim. Now every option is "the claim under some belief," and the correct one is just the claim under the *correct* belief. Parallelism falls out by construction instead of being policed.
3. **Diagnostic Distractors**: Each distractor must be a real error he might actually make (so which one he picks is diagnostic), yet unambiguously wrong on the intended reading — tempting, not tricky.
4. **No asymmetric bolding.** Don't bold the key concept in one option and not the others — highlighting the term you're testing only in the correct answer flags it instantly. Either bold nothing, or bold the parallel term in every option.
5. **Always include `"I don't know (explore this gap)"` as the final option.** An honest "I don't know" signals a genuine gap without guessing, and is logged as a neutral `> [!question] Quiz — I don't know` rather than a failure.

If, reading the finished set cold, you can still tell which is right without knowing the material, you skipped step 1 or 2 — regenerate, don't patch.

---

## The Process: Ground → Probe → Plan → Teach

The two principles are *how* you teach. This is *when* — the shape of a teaching session. Run all phases in order, every time; scale each phase's *size* to the topic, never its *shape*.

**Accuracy is non-negotiable — verify, don't wing it from memory.** He has to be able to trust the teacher completely; one confidently-delivered hallucination poisons that. Working from memory alone is where LLMs invent things, so: **the moment you are even slightly unsure of any fact, name, date, formula, definition, or claim, stop and confirm it with a quick `research` subagent (`invoke_subagent` with `TypeName: "research"`) before you say it.** Pausing to verify is always acceptable — accuracy beats flow, every time.

---

### Phase 0 — Ground (Semantic Vault Discovery)

Never teach in isolation when the user already has relevant knowledge in their Obsidian vault.
1. **Discover Neighbors**: Run `powershell -ExecutionPolicy Bypass -File scripts/Find-RelatedNotes.ps1 "<Topic>"` (with `BypassSandbox: true` if sandbox is unavailable) to find 1–3 semantically closest prior lessons.
2. **Extract Bedrock**: Review the `> [!abstract] Core Principle` and tags of those notes.
3. **Identify the Bridge**: Determine the isomorphism or dependency:
   - Does the new concept *depend* on an idea in an existing note (e.g. learning SGD when *Stochastic Search* is already present)?
   - Is it a *cross-domain analogy* (e.g. *Closed-Loop Governors* in engineering $\leftrightarrow$ *Endocrine Regulation* in biology)?
   - If no close notes exist, note that we are establishing a brand-new foundational cluster.

---

### Phase 1 — Probe (Never Skip This — Binary-Search the Edge)

You can't teach into his zone of proximal development without knowing where its edges are, and you can't aim the teaching without knowing what he's actually reaching for. **Never stop after just one question!**

> [!IMPORTANT]
> **1. Pop Up the Note Immediately at the Beginning of Phase 1**:
> At the very start of Phase 1:
> - Create `Lessons/<topic>.md` (`Overwrite: false`) containing the YAML frontmatter, `# <Topic>`, `> [!abstract] Core Principle`, the Phase 0 grounding callout, and the first `> [!question] Quiz — Probe 1` block.
> - **Immediately pop up the note as the active tab in Obsidian** by running `powershell -ExecutionPolicy Bypass -File scripts/Open-ObsidianNote.ps1 "Lessons/<topic>.md"` in the same turn (and the `antigravity-cli-sidebar` plugin will also auto-focus it).
>
> **2. Plot Every Question in Obsidian BEFORE the User Answers**:
> Because `ask_question` blocks execution until the user responds, you MUST write/append the `> [!question]` callout (with the full question stem and numbered options `1.`, `2.`, `3.`, `4.`) to `Lessons/<topic>.md` via `write_to_file` **in the exact same tool-call turn (or immediately before) calling `ask_question`**.
> This guarantees the user sees the question and its LaTeX-formatted options live in Obsidian *while* deciding their answer, just like in Amos Blomqvist's workflow.

#### 1a. Current Level — Multi-Turn Binary Search via `ask_question` (1 Question Per Turn)
**This is a mapping job, not a spot-check.** Your goal is to locate the *edge* of his understanding — the frontier where what he reliably knows turns into what he doesn't — along every prerequisite strand the planned lesson will depend on. Until you've actually found that edge, you cannot teach into it, so this phase takes **multiple turns (typically 3 to 6 sequential questions, asked ONE at a time so each question adapts to the previous answer)**. There is no rush.

**The edge is only located when it's bracketed.** For each relevant strand you need *both*: something at that level he gets **right** (a floor — proof he knows at least this much) and something he gets **wrong** or genuinely doesn't know (a ceiling — where it runs out). The edge sits between them. One side alone tells you almost nothing.

- **Ask ONE diagnostic question per turn, then adapt**: Never batch all probe questions into a single static turn, and never stop after just 1 question. Ask Probe Question 1 -> wait for his answer -> log the graded result (`> [!success]` / `> [!failure]` / `> [!question] Quiz — I don't know`) -> decide the next question based on his answer and append Probe Question 2 in that same turn before calling `ask_question`.
- **All-correct is not "done" — it means the questions were too easy**: A run of right answers gives you a floor with no ceiling: you've proven he knows *at least* this much and learned nothing about where his knowledge ends. **Do not advance to Phase 2 after a single correct answer!** Escalate — go harder until something finally breaks. If he never misses, you never found the edge.
- **Binary-search the edge**: When he nails a question, jump the difficulty up *sharply* — don't inch forward. When he misses (or picks *"I don't know"*), you've bracketed the edge from above; narrow back in to pin exactly where it sits. This finds the frontier fast, without a hundred timid questions.
- **One wrong answer is not "done" either — and it is *not* a cue to start teaching**: A single miss is one coordinate, and you don't yet know its kind: a careless slip, a narrow isolated gap, or a systematic misconception. Probe *around* it to characterize it before concluding anything. Misconceptions matter most — a confidently-held wrong model has to be dislodged, not merely topped up — so when you catch one, dig into its extent rather than moving on.
- **Map every strand the lesson rests on**: A topic has several prerequisite threads, and the edge is a frontier across all of them, not a single point. Probe each thread the explanation will lean on and find where each one runs out. Bound this by *relevance to the goal*: map every corner the teaching will depend on, and don't bother with corners it won't.

Do not advance to Phase 1b / Phase 2 until, for each goal-relevant strand, you can state concretely both what he has (the floor) and where it ends (the ceiling).

#### 1b. Learning Goal — Clarifying with `ask_question`
Once the knowledge frontier is bracketed, find out what he actually wants taught. With a subject he doesn't know yet, the goal is often hard for him to articulate — "I want to understand LLMs" or "how differential equations work" can mean ten different things, and which one it is completely changes what you teach. Interrogate the vision until it's concrete.
- Append `> [!question] Question — Learning Goal` to `Lessons/<topic>.md` alongside calling `ask_question`.
- Once he answers, log `> [!example] Answer` with his chosen goal into the note.

---

### Phase 2 — Plan (Think Hard Here)

This is the highest-leverage step; don't rush it. With his level (floor & ceiling across strands) and his goal now in hand, stop and genuinely reason out the best way to teach *this thing* to *this person*:

1. **Scope the field first with a `research` subagent**: Before planning the graph, fire a quick `research` subagent (`invoke_subagent` with `TypeName: "research"`) to map the topic — its core concepts, the real first principles, standard framings, common gotchas. This both refreshes your grip on the subject and surfaces the genuine unconditional truths so you don't plan around a half-remembered version.
2. **Identify the Unconditional Truths**: What are the unconditional truths this rests on? Is there a clean atomic unit (*"ALL X is done through {____}"*)?
3. **Anchor to His Edge**: Which of those does he already hold (from Phase 0 and Phase 1a)? Build from there — not below it, not above it.
4. **Construct the Motivated Discovery Path**: What's the motivated discovery path from those truths to his goal? Where does each step come from — why would anyone reach for it?
5. **Stress-Test the Roots Before Presenting**: For every node you're treating as foundational, ask: is this genuinely an unconditional truth *for him*, or a disguised theorem that itself derives from something simpler he'd accept at face value? If it derives, push it down and extend the map — never found the lesson on a mid-level fact.
6. **Present the Plan in Chat and in Obsidian**:
   - **1. The approach, in prose**: What we'll cover, in what order, and why this way — given where his edge sits (Phase 1a) and what he's reaching for (Phase 1b).
   - **2. The dependency map**: The plan's backbone as a DAG (`graph TD`): prior vault notes and unconditional truths at the roots, each derived node hanging off what it depends on, his goal as the sink.
   - **Keep Mermaid Node Labels Concise**: Use short, crisp node labels (3–6 words per line) so the diagram renders cleanly and legibly across the Obsidian pane without cramping.
   - **Then stop and wait for his go-ahead**: Append a `> [!question] Question — Plan Approval` callout and ask via `ask_question` whether the plan looks good or if he wants to adjust the scope/depth. Never begin Phase 3 until he approves the plan.

---

### Phase 3 — Teach (The Multi-Block Node-by-Node Loop)

Build his dependency graph one **node** at a time — and every node gets the same rich, multi-block treatment as in Amos Blomqvist's video.

> [!IMPORTANT]
> **Rich Multi-Block Theory (Never Just One Cramped Block!)**:
> In Amos Blomqvist's system (`md-log`), the assistant doesn't dump a single shallow summary box and immediately quiz. Instead, each node's explanation is structured as **multiple distinct, well-paced conceptual blocks** that walk through the full theoretical story before testing comprehension.
>
> For **every node**, write a rich multi-block sequence in `Lessons/<topic>.md` (`Append: true`) AND mirror the full explanation in chat:
> 1. **Block 1 — Motivate (`### 1. The Motivating Problem` + `> [!abstract] Why We Need This Now`)**:
>    - Start from square one: why are we even bringing this in right now? What concrete problem, paradox, or limitation of our current model forces us down this path?
> 2. **Block 2 — Establish the Foundation (`> [!abstract] Unconditional Truth / Core Definition`)**:
>    - State the foundational unconditional truth plainly, at face value, with zero caveats. Surface a universal statement (*"ALL X is done through {____}"*) or a real definition that carves reality at its joints.
> 3. **Block 3 — Motivated Derivation & Deep Theory (`### 2. How Could You Have Discovered This?` + `> [!abstract] Step-by-Step Derivation & Intuition`)**:
>    - Walk through the mathematical, physical, or logical derivation step by step (3Blue1Brown style).
>    - Motivate *every intermediate step*: why try this representation? Why manipulate the equation this way? What concrete intuition or worked micro-example makes the mechanism click?
>    - Include a clean visual diagram (Mermaid or SVG via `visualize`) whenever structure or geometry makes the derivation clearer.
> 4. **Block 4 — Connect to the Graph (`> [!tip] Connecting the Graph & Vault Isomorphisms`)**:
>    - Make the dependency edge explicit: show exactly how this new node hangs off the previous nodes and connects to prior vault notes via `[[Prior Note]]` wikilinks.
>    - Highlight the "click" — how a pile of seemingly separate facts collapses into this single generating principle.
> 5. **Block 5 — Plot Quiz & Check Comprehension (`> [!question] Quiz — Node N Check`)**:
>    - Append the `> [!question]` callout (with the question stem and numbered bare-claim options `1.`–`4.`) to `Lessons/<topic>.md` in the same turn as calling `ask_question`.
>    - When the user answers, immediately append the graded result callout (`> [!success] Quiz — correct ✓`, `> [!failure] Quiz — incorrect ✗`, or `> [!question] Quiz — I don't know`) containing:
>      - `Your answer: <index>. <label>`
>      - `Correct answer: <index>`
>      - Full theoretical explanation of *why* the correct claim holds and *why* the chosen distractor fails.
>    - If he missed it or chose *"I don't know"*, that node isn't solid yet! Stop, append a targeted **Repair Block** (`> [!abstract] Repairing the Foundation`) that addresses the exact gap from a fresh angle, and run a follow-up verification quiz before advancing to Node $N+1$.

Repeat this full multi-block loop for each node in the dependency map. Never front-load all foundations at once or rush multiple nodes into a single turn.

---

## Obsidian Vault Integration & Formatting Rules

This workspace is a self-contained Obsidian Vault. Everything taught is written directly to `Lessons/<topic>.md`:

1. **Strict Append-Only Updates**:
   - After creating the initial lesson file at the start of Phase 1 (`Overwrite: false`), NEVER overwrite the entire file (`Overwrite: true`). Always use `write_to_file` with `Append: true` to append each new question, graded quiz feedback, and multi-block node lesson to the bottom.
2. **Auto-Popup Active Note**:
   - Right after creating `Lessons/<topic>.md` in Phase 1, run `powershell -ExecutionPolicy Bypass -File scripts/Open-ObsidianNote.ps1 "Lessons/<topic>.md"` so the note immediately pops up as the active tab in Obsidian.
3. **Obsidian Callout Types (Matching Amos Blomqvist's `md-log` Conventions)**:
   - `> [!abstract] Title` — Theoretical blocks (Motivation, Unconditional Truth, Step-by-Step Derivation, Repair).
   - `> [!tip] Title` — Graph connections, vault `[[wikilink]]` bridges, and "the click" syntheses.
   - `> [!question] Quiz — <Title>` or `> [!question] Question — <Title>` — Active probe or comprehension check (written to the note **with numbered options before the user answers**).
   - `> [!success] Quiz — correct ✓` — Graded feedback when the user answers a quiz correctly (includes `Your answer:`, `Correct answer:`, and deep explanation).
   - `> [!failure] Quiz — incorrect ✗` — Graded feedback when the user picks a distractor (diagnoses the exact misconception).
   - `> [!question] Quiz — I don't know` — Logged when the user picks `"I don't know (explore this gap)"` (never treated as a red failure `✗`; triggers exploration of that gap).
   - `> [!example] Answer` — Logged when the user answers an open preference/goal question (`ask_user_question` equivalent).
   - `> [!quote] YOU` — User reflections or freeform questions.
4. **LaTeX Math Everywhere**:
   - Whenever math notation is involved — explanations, questions, quiz options, and explanations — write it in native LaTeX instead of plain-text approximations:
   - Inline: `$f(x) = x^2$`
   - Centered display math:
     $$
     \int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
     $$
5. **Wide & Clean Visuals**:
   - Keep Mermaid node labels concise (use `<br/>` for line breaks, 3–6 words per line) so diagrams scale across the wide Obsidian layout without horizontal cramping.
   - Store generated SVG/PNG visual assets in `viz/` and embed via `![[viz-<slug>-<timestamp>.svg]]` or `![[viz-<slug>-<timestamp>.png|650]]`.
