# Highlight Component

The `<Highlight>` component applies a marker-style background + colored text to inline content. Use it to visually emphasize key terms, numbers, or short phrases within a sentence.

## Types

| Type | Background | Text Color | Use For |
|------|-----------|------------|---------|
| `primary` | Blue tint | Blue (`--c-primary`) | Key terms, important numbers, default |
| `positive` | Green tint | Green (`--c-positive`) | Positive trends, growth, improvements |
| `negative` | Red tint | Red (`--c-negative`) | Negative trends, decline, risks |
| `accent` | Orange tint | Orange (`--c-accent`) | Warnings, items needing attention |
| `important` | Purple tint | Purple (`--c-important`) | Critical points, must-know items |

## Syntax

```md
Revenue grew <Highlight type="positive">+99.3%</Highlight> year-over-year
```

### Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | String | `'primary'` | One of: `primary`, `positive`, `negative`, `accent`, `important` |

## Examples

### Key Metrics

```md
- Revenue grew <Highlight type="positive">+99.3%</Highlight> year-over-year
- Margin dropped to <Highlight type="negative">37.4%</Highlight> from 59.1%
- Target price: <Highlight>¥16,000</Highlight>
- Tariff risk rated <Highlight type="accent">High</Highlight>
```

### In a Bullets Slide

```md
---
layout: bullets
---

::header::

# Quarterly Performance

::default::

- Q3 revenue reached <Highlight>¥806.3B</Highlight> (+86% YoY)
- Operating margin improved to <Highlight type="positive">19.25%</Highlight>
- Memory costs surged <Highlight type="negative">+41%</Highlight> in 3 months
- Full-year progress rate at 81.2%
```

### In a Table

```md
| Metric | FY2024 | FY2025 | Change |
|--------|--------|--------|--------|
| Revenue | ¥1.16T | ¥2.25T | <Highlight type="positive">+93%</Highlight> |
| Op. Margin | 24.2% | 16.4% | <Highlight type="negative">-7.8pp</Highlight> |
```

## Highlight vs Span Utility Classes

| Technique | Visual Effect | Best For |
|-----------|--------------|----------|
| `<Highlight>` | Background + colored text + bold | Key figures that need strong emphasis |
| `<span class="c-positive">` | Colored text only | Subtle inline coloring |
| `<Highlight>` + `**bold**` | Not needed — Highlight already applies `font-weight: 600` | — |

**Rule of thumb**: Use `<Highlight>` for the 1-2 most important data points per slide. Use `<span class="c-...">` for lighter emphasis where a background would be distracting.
