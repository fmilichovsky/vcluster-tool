FROM mcr.microsoft.com/azure-cli:2.9.1

RUN apk --no-cache add curl

# kubectl
RUN curl -L -o kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -c -m 0755 kubectl /usr/local/bin/kubectl
RUN rm -f kubectl

# vcluster CLI
RUN curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64"
RUN install -c -m 0755 vcluster /usr/local/bin/vcluster
RUN rm -f vcluster

# FluxCLI
RUN curl -s https://fluxcd.io/install.sh | FLUX_VERSION=2.1.2 bash

CMD ["bash"]
