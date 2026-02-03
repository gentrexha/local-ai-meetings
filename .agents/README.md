# AI Agent Skills

This directory contains tool-agnostic skill definitions that any AI coding assistant can use.

Each skill lives in `.agents/skills/<skill-name>/SKILL.md` and follows a standard format with YAML frontmatter (name, description) and markdown instructions.

## Available Skills

| Skill | Description |
|-------|-------------|
| `meeting-summary` | Generate concise markdown summaries from meeting transcripts |
| `follow-up-email` | Draft post-interview follow-up emails from transcripts |

## Tool Setup

### Cursor

Symlink the skills directory so Cursor discovers them automatically:

```bash
ln -s .agents/skills .cursor/skills
```

### Claude Code

Reference skills in your `CLAUDE.md`:

```markdown
Skills are defined in `.agents/skills/`. Read the relevant SKILL.md before executing a skill.
```

### Other Tools

Point your tool's configuration at the `SKILL.md` files directly. Each file is self-contained with its own instructions and output format.
