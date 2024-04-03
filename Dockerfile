FROM ghcr.io/vmware-tanzu-labs/educates-jdk21-environment:2.7
RUN curl --fail -sL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_amd64.zip
RUN unzip /tmp/terraform.zip
USER root
RUN mv terraform /usr/local/bin/
RUN sudo dnf -y install azure-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
USER 1001
RUN ssh-keygen -m PEM -t rsa -b 4096 -N '' -f "./azure-workshop-ssh" -C tapworkshopuser
