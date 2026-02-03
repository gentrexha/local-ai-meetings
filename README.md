# local-ai-meetings

Local-first meeting transcription and AI summarization. No cloud services, no API keys — everything runs on your machine.

## Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/local-ai-meetings.git
cd local-ai-meetings
make setup          # Check dependencies
```

### Process a recording

```bash
# Drop a video file in the project root, then:
make process P=Alice_Bob
```

This will:
1. Extract audio from the latest video file
2. Transcribe with Whisper
3. Move everything into `meetings/YYYY_MM_DD_Alice_Bob/`

### Other commands

```bash
make help           # Show all commands
make list           # List available recordings
```

## Supported Formats

Video: `.mov` `.mp4` `.webm` `.mkv` `.avi`

## Output Structure

```
meetings/
└── 2026_01_15_Alice_Bob/
    ├── 2026_01_15_Alice_Bob.mp3    # Extracted audio
    ├── 2026_01_15_Alice_Bob.txt    # Transcript
    └── 2026_01_15_Alice_Bob.md     # Summary (via AI skill)
```

The `meetings/` directory is gitignored — your recordings and transcripts stay local.

## AI Agent Skills

This project includes skill definitions that AI coding assistants can use to process transcripts:

| Skill | What it does |
|-------|-------------|
| **meeting-summary** | Generate concise markdown summaries with key points and action items |
| **follow-up-email** | Draft specific, enthusiastic post-interview follow-up emails |

See [`.agents/README.md`](.agents/README.md) for setup instructions with Cursor, Claude Code, or other tools.

## Requirements

| Dependency | Install |
|-----------|---------|
| [ffmpeg](https://ffmpeg.org/) | `brew install ffmpeg` |
| [openai-whisper](https://github.com/openai/whisper) | `pip install openai-whisper` |

## License

MIT
