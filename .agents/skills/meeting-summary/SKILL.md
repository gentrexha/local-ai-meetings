---
name: meeting-summary
description: Create concise markdown summaries from meeting transcript text files. Use when the user asks to summarize a meeting, create meeting notes, or extract action items from a .txt transcript file.
---

# Meeting Summary

Generate a concise markdown summary from a meeting transcript (.txt file).

## Workflow

1. **Read** the provided .txt transcript file from the `meetings/` subdirectory
2. **Analyze** the content to extract:
   - Main discussion topics
   - Key decisions and points
   - Action items with owners (if mentioned)
   - Participants (infer from context if not explicit)
3. **Write** the summary as a markdown file in the same directory, using the same base filename with `.md` extension

## Output Format

Write the summary using this template:

```markdown
# Meeting Summary

**Date:** [Extract from filename or content, format: YYYY-MM-DD]
**Participants:** [Names mentioned or inferred from transcript]

## Summary

[2-3 sentences capturing the main purpose and outcome of the meeting]

## Key Points

- [Important point 1]
- [Important point 2]
- [Additional points as needed]

## Action Items

- [ ] [Action item] — @[Owner if known]
- [ ] [Action item] — @[Owner if known]

---
*Generated from transcript: [filename.txt]*
```

## Guidelines

- Keep the summary **concise** — aim for quick readability
- Action items should be **specific and actionable**
- If owner is unclear, omit the @mention
- Transcripts live in `meetings/YYYY_MM_DD_Participants/` subdirectories
- Extract date from filename pattern `YYYY_MM_DD_*` when present
- Infer participants from names mentioned in dialogue
- Omit sections if no relevant content (e.g., no clear action items = skip that section)
