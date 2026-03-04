FROM ubuntu:22.04
LABEL maintainer="Teja"
LABEL description="OpenClaw AI Assistant Gateway"
LABEL version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl bash ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -r openclaw && useradd -r -g openclaw -m openclaw

RUN curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-prompt --no-onboard

RUN openclaw config set gateway.bind lan && \
    openclaw config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true

RUN mkdir -p /root/.openclaw && \
    chown -R openclaw:openclaw /root/.openclaw

USER openclaw
WORKDIR /home/openclaw
EXPOSE 18790

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD openclaw health || exit 1

CMD ["openclaw", "gateway", "run", "--port", "18790", "--allow-unconfigured"]
