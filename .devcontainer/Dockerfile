FROM jenkins/jenkins:lts
# if we want to install via apt
ARG TERRAFORM_VERSION=1.3.9
ARG VAULT_VERSION=1.12.3
ARG ANSIBLE_VERSION=2.10.7


USER root

RUN apt-get update -y && apt-get install wget -y && wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && unzip vault_${VAULT_VERSION}_linux_amd64.zip && mv vault /usr/local/bin && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && mv terraform /usr/local/bin && rm vault_${VAULT_VERSION}_linux_amd64.zip && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 python3-pip sshpass git openssh-client jq && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==${ANSIBLE_VERSION} && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm

# drop back to the regular jenkins user - good practice
USER jenkins
# RUN python -m pip install --user ansible
# install-plugins script
# RUN jenkins-plugin-cli --plugins docker-slaves github-branch-source:1.8