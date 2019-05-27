FROM jenkins/jenkins:lts
USER root
RUN set -eux && \
    apt-get update && \
    apt-get install \
    sudo \
    python \
    python-pip \
    wget \
    software-properties-common \
    vim -y && \
    apt-add-repository ppa:ansible/ansible && \
    rm -rf /etc/apt/sources.list.d/ansible-ubuntu-ansible-eoan.list && \
    apt-get update && \
    apt-get install ansible -y && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz && \
    tar -xvf go1.11.2.linux-amd64.tar.gz && \
    mv go /usr/local && \
    rm -f go1.11.2.linux-amd64.tar.gz && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    echo "Host *" >> /etc/ssh/ssh_config && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config
USER jenkins
