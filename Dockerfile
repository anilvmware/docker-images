FROM ghcr.io/vmware-tanzu-labs/educates-jdk21-environment:2.7
RUN curl --fail -sL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_amd64.zip
RUN unzip /tmp/terraform.zip
USER root
RUN mv terraform /usr/local/bin/
RUN sudo dnf -y install azure-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
RUN curl -L https://github.com/vmware-tanzu/tanzu-cli/releases/download/v1.3.0-alpha.2/tanzu-cli-linux-amd64.tar.gz -o tanzu-cli-linux-amd64.tar.gz
RUN tar -zxvf tanzu-cli-linux-amd64.tar.gz
RUN sudo mv v1.3.0-alpha.2/tanzu-cli-linux_amd64 /usr/local/bin/tanzu
RUN chmod +x /usr/local/bin/tanzu
USER 1001
RUN ssh-keygen -m PEM -t rsa -b 4096 -N '' -f "./azure-workshop-ssh" -C tapworkshopuser
