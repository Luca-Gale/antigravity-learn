---
name: visualize
description: "Add a correct, minimal visual to a lesson — a Mermaid dependency/flow diagram or a spatial/geometric SVG/PNG picture — that renders inline in Obsidian. Use when an idea is genuinely clearer as a picture: dependency graph, system architecture, state machine, tree, or geometric coordinate layout. Adapted for Antigravity and Obsidian."
---

# Visualize (Antigravity & Obsidian Edition)

A picture earns its place only when it shows something words can't — shape, structure, direction, relationship, geometry. This skill produces ONE such visual, guarantees it is **correct**, and drops it into the lesson so it renders inline in Obsidian.

You are the **creative director**. You decide the exact idea and distill it to its fewest carrying elements.

---

## When to Visualize (and When Not To)

This teaching system builds a **dependency graph in the learner's head** — axioms at the root, derived facts hanging off them. A visual is powerful exactly when it makes that structure (or a geometry) visible. Reach for one when:

- The idea is a **structure or relationship**: dependencies, a system with parts and arrows, a flow/pipeline, a sequence of exchanges, a state machine, a tree/hierarchy, a comparison, a containment (what's inside vs outside).
- The idea is **spatial or geometric**: coordinate geometry, a number line, vectors, a function's shape, a physical arrangement.

**Do NOT visualize** when prose or a single equation already carries it. A decorative diagram that just restates the sentence next to it adds noise and a chance to be wrong. When in doubt, don't — a missing visual is cheaper than a false one.

---

## Choosing the Visual Format

### 1. Structural / Relational Visuals: Mermaid (Native in Obsidian)
- **Best for**: Dependency graphs, flowcharts (`graph TD` / `graph LR`), sequence diagrams, state machines, architecture pipelines.
- **Obsidian Support**: Obsidian renders Mermaid **natively and interactively** without needing any external renderer!
- **Concise Labels & Layout**:
  - Prefer `graph TD` (top-down) over wide `graph LR` diagrams whenever there are more than 3 sequential steps, so the diagram flows vertically down the note rather than cramping horizontally.
  - Keep node labels short (3–6 words per line, using `<br/>` for line breaks) and prune any decorative nodes (aim for 4–7 nodes maximum per diagram).
- **Usage**:
  ```markdown
  ```mermaid
  graph TD
      A["Unconditional Truth:<br/>Packet Switching"] --> B["Ordering & Reassembly"]
      A --> C["Retransmission on Loss"]
      B --> D["Reliable Stream (TCP)"]
      C --> D
  ```
  ```

### 2. Spatial / Geometric Visuals: SVG / PNG
- **Best for**: Coordinate systems, vectors, number lines, plots, physical layouts, custom shapes with exact coordinates.
- **Obsidian Support**: Obsidian natively renders SVG vector files using `![[viz-<slug>.svg]]` or PNG raster images using `![[viz-<slug>.png|650]]`.
- **Location**: Save visual assets directly to `viz/` at the root of the workspace vault.

---

## The Verification Loop (Look Before You Embed)

The golden rule of this system is **correctness over decoration**:
1. **Never assert something false**: A diagram with an inverted arrow or incorrect coordinates misinforms the learner and corrupts the conceptual graph.
2. **Visual Inspection**:
   - When generating an image file (PNG/SVG), use Antigravity's `view_file` tool on the resulting image path.
   - Look at the rendered picture critically:
     - Are the arrows pointing the right direction?
     - Are labels readable and unclipped?
     - Is the coordinate math geometrically true?
   - If flawed, tweak and re-inspect before presenting to the learner.

---

## Embedding in the Lesson Note

Embed the visual directly in the Obsidian lesson note:
- For Native Mermaid:
  Place it inside an Obsidian Callout:
  ```markdown
  > [!abstract] Architectural Map
  > ```mermaid
  > graph TD
  >    ...
  > ```
  ```
- For Vault Images:
  ```markdown
  ![[viz-tcp-handshake.png|500]]
  ```
  Or standard relative Markdown links:
  ```markdown
  ![](../viz/viz-tcp-handshake.png)
  ```
