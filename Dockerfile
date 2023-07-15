# Dockerfile for custom Jenkins image that installs python3, Terraform and awscli
FROM jenkins/jenkins:lts

ENV DOCKERVERSION=20.10.17

USER root

RUN apt-get update && apt-get upgrade -y

#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y apt-transport-https
RUN dpkg --configure -a && apt-get install -f

# apt update and install required packages
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
    curl less zip unzip wget make \
    build-essential libssl-dev libffi-dev libssl-dev zlib1g-dev \ 
    libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \ 
    libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev

# Download and install python3 latest version
RUN curl -fsSLO https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz \
    && tar -xzvf Python-3.11.3.tgz \
    && rm Python-3.11.3.tgz \
    && cd Python-3.11.3 \
    && ./configure --target=/usr/local \
    && make install

ENV PATH=/var/jenkins_home/.local/bin/:$PATH

# Download and install Terraform latest version
RUN curl -fsSLO https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip \
    && unzip terraform_1.4.6_linux_amd64.zip -d /usr/local/bin \
    && chmod 755 /usr/local/bin/terraform \
    && rm terraform_1.4.6_linux_amd64.zip

# Download and install AWS CLI
RUN curl -fsSLO "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    && unzip awscli-exe-linux-x86_64.zip \
    && ./aws/install -i /usr/local/aws -b /usr/local/bin \
    && rm -rf awscli-exe-linux-x86_64.zip

#USER jenkins