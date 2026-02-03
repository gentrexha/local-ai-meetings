---
name: follow-up-email
description: Draft a post-interview follow-up email from a meeting transcript or summary. Use when the user asks to write a thank-you or follow-up email after an interview or meeting.
---

# Follow-Up Email

Draft an enthusiastic, specific post-interview follow-up email from a meeting transcript or summary.

## Workflow

1. **Find** the transcript (.txt) and/or summary (.md) in the relevant `meetings/` subdirectory
2. **Extract** key details:
   - Interviewer name(s)
   - Company name
   - Specific topics, projects, or ideas discussed
   - Any mutual interests or memorable moments
3. **Write** the email as `.email.md` in the same meeting directory

## Output Format

Write the email using this structure:

```markdown
**To:** [Interviewer name]
**Subject:** [Specific, natural subject line — not generic]

[Opening: Express genuine enthusiasm. Reference something specific from the conversation.]

[Middle: Connect a discussed topic to your experience or interest. Show you were engaged and listening.]

[Closing: Reaffirm interest, mention next steps if discussed, warm sign-off.]

[Your name]
```

## Guidelines

- **Be specific** — reference actual topics from the conversation, not generic pleasantries
- **Tone:** enthusiastic, grateful, professional yet warm — not stiff or corporate
- **Length:** 150-200 words for the body
- **Timeliness:** designed to be sent within 4 hours of the meeting
- **Avoid cliches:** no "I wanted to reach out," "per our conversation," or "I hope this finds you well"
- **Subject line:** reference a specific topic discussed, not just "Thank you for your time"
- **If multiple interviewers:** draft a separate email for each, varying the specific details referenced
- Name output files `follow-up-[interviewer-name].email.md` when there are multiple interviewers
