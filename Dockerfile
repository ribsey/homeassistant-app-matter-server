ARG BUILD_ARCH=amd64
ARG MATTER_SERVER_VERSION=8.5.0
ARG BASHIO_VERSION=0.17.1
ARG TEMPIO_VERSION=2024.11.2
ARG S6_OVERLAY_VERSION=3.1.6.2
ARG NODE_VERSION=22.21.1

FROM homeassistant/${BUILD_ARCH}-addon-matter-server:${MATTER_SERVER_VERSION}

ARG MATTERJS_VERSION=0.8.0

LABEL org.opencontainers.image.description="Based on https://github.com/home-assistant/addons/tree/master/matter_server. Defaults to beta mode and preinstalls matter.js (matter-server@${MATTERJS_VERSION})."

ENV NPM_CONFIG_FETCH_TIMEOUT=5000
ENV NPM_CONFIG_FETCH_RETRY_MAXTIMEOUT=10000
ENV NPM_CONFIG_FETCH_RETRY_MINTIMEOUT=1000

RUN mkdir -p /opt/matterjs && cd /opt/matterjs && \
    npm install --foreground-scripts "matter-server@${MATTERJS_VERSION}"

