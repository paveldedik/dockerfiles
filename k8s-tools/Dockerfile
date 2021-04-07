FROM alpine:3

ENV version=1.0
ENV KUBE_VERSION=1.20.4
ENV HELM_VERSION=3.5.3

# Metadata
LABEL name=k8s-tools version=$version \
    maintainer="Pavel Dedik <dedikx@gmail.com>"

RUN apk add --no-cache ca-certificates bash git openssh curl jq bind-tools vault \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config \
    && helm repo add "stable" "https://charts.helm.sh/stable" --force-update

WORKDIR /config

CMD bash
