
FROM alpine:latest

# Dpendencies.
RUN apk --no-cache add \
    ca-certificates \
    curl \
    jq \
    bash

RUN apk --no-cache add azure-cli

RUN apk --no-cache add kubectl

RUN curl -s https://fluxcd.io/install.sh | sudo FLUX_VERSION=2.1.2 bash

RUN curl -sL https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64 -o /usr/local/bin/vcluster
RUN chmod +x /usr/local/bin/vcluster

CMD ["bash"]
