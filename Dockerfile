FROM mcr.microsoft.com/azure-cli:2.9.1

RUN apk --no-cache add curl

ARG KUBECTL_VERSION=1.28.4
ARG VCLUSTER_VERSION=0.17.1
ARG FLUX_VERSION=2.1.2

# kubectl
RUN curl -L -o kubectl "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
RUN install -c -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -f kubectl

# vcluster CLI
RUN curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/download/v${VCLUSTER_VERSION}/vcluster-linux-amd64"
RUN install -c -m 0755 vcluster /usr/local/bin/vcluster
RUN rm -f vcluster

# FluxCLI
RUN curl -s https://fluxcd.io/install.sh | FLUX_VERSION=${FLUX_VERSION} bash

CMD ["bash"]
