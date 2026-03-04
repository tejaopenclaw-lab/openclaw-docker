# OpenClaw Docker

Production-grade containerized deployment of OpenClaw AI Assistant.

## Quick Start
```bash
docker build -t openclaw:latest .
docker run -d --name openclaw-gateway -p 18790:18790 openclaw:latest
```

## Pipeline
GitHub Actions automatically builds and pushes on every push to main.
