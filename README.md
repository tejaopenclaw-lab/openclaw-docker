# OpenClaw Docker

Production-grade containerized deployment of OpenClaw AI Assistant.

## Quick Start
```bash
docker build -t openclaw:latest .
docker run -d --name openclaw-gateway -p 18790:18790 openclaw:latest
```

## Pipeline
GitHub Actions automatically builds and pushes on every push to main.
# Pipeline test Tue Mar  3 23:52:33 PST 2026
# Fix Docker credentials Wed Mar  4 00:19:56 PST 2026
