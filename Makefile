# Default whisper language
LANG := en

# Supported video formats
FORMATS := mov mp4 webm mkv avi

# Auto-detect latest video file if not specified
INPUT ?= $(shell ls -t $(foreach fmt,$(FORMATS),*.$(fmt)) 2>/dev/null | head -1)

# Extract date from filename (assumes format YYYY-MM-DD HH-MM-SS.ext)
DATE := $(shell echo "$(INPUT)" | cut -d' ' -f1 | tr '-' '_')

# Output directory (only if P is set)
ifdef P
DIR := meetings/$(DATE)_$(P)
endif

.PHONY: process list help setup

help:
	@echo "Usage:"
	@echo "  make process P=Alice_Bob              # Process latest recording"
	@echo "  make process INPUT=\"file.mov\" P=Alice_Bob"
	@echo "  make list                              # List available recordings"
	@echo "  make setup                             # Check dependencies"
	@echo ""
	@echo "Variables:"
	@echo "  INPUT    Source video file (default: latest)"
	@echo "  P        Participant names joined by _ (required)"
	@echo "  LANG     Whisper language (default: en)"
	@echo ""
	@echo "Supported formats: $(FORMATS)"

list:
	@found=0; \
	for fmt in $(FORMATS); do \
		files=$$(ls -t *.$$fmt 2>/dev/null); \
		if [ -n "$$files" ]; then \
			echo "$$files"; \
			found=1; \
		fi; \
	done; \
	[ $$found -eq 0 ] && echo "No recordings found"

setup:
	@echo "Checking dependencies..."
	@printf "  ffmpeg:  " && (command -v ffmpeg >/dev/null 2>&1 && echo "OK ($(shell ffmpeg -version 2>&1 | head -1 | cut -d' ' -f3))" || echo "MISSING — install with: brew install ffmpeg")
	@printf "  whisper: " && (command -v whisper >/dev/null 2>&1 && echo "OK" || echo "MISSING — install with: pip install openai-whisper")
	@echo ""
	@echo "All set!" 2>/dev/null || true

process:
ifndef P
	$(error P is not set. Usage: make process P=Name1_Name2)
endif
ifeq ($(INPUT),)
	$(error No video file found in current directory)
endif
	@command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "ffmpeg is required but not installed. Run: make setup"; exit 1; }
	@command -v whisper >/dev/null 2>&1 || { echo >&2 "whisper is required but not installed. Run: make setup"; exit 1; }
	@echo "Processing: $(INPUT)"
	@echo "Output:     $(DIR)"
	@mkdir -p "$(DIR)"
	@echo "Converting to mp3..."
	ffmpeg -i "$(INPUT)" -q:a 0 -map a "$(DIR)/$(DATE)_$(P).mp3" -y
	@echo "Transcribing with whisper..."
	whisper "$(DIR)/$(DATE)_$(P).mp3" --language $(LANG) --output_dir "$(DIR)" --verbose True
	@echo "Moving original file to directory..."
	@mv "$(INPUT)" "$(DIR)/"
	@echo "Done! Transcript available in: $(DIR)/"
