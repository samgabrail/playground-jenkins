FROM jenkins/jenkins:2.456
ARG TERRAFORM_VERSION=1.3.9
ARG VAULT_VERSION=1.12.3
ARG ANSIBLE_VERSION=2.10.7

USER root

# Installing system dependencies
RUN apt-get update -y && apt-get install -y wget unzip python3-pip python3-venv sshpass git openssh-client jq gnupg2 

# Installing HashiCorp products
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
    mv vault /usr/local/bin && \
    rm vault_${VAULT_VERSION}_linux_amd64.zip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Setup Python virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages in the virtual environment
RUN pip install --upgrade pip cffi && \
    pip install ansible==${ANSIBLE_VERSION} && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm

# Switch back to jenkins user
USER jenkins
