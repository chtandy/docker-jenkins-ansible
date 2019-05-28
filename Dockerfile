FROM jenkins/jenkins:lts                                                                                                                  
USER root
RUN set -eux && \
    apt-get update && \
    apt-get install \
    sudo \
    python \
    wget \
    curl \
    zlib1g-dev \
    rsync \
    python-pip \
    vim -y
##  ansible
RUN apt-get install software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible && \
    rm -rf /etc/apt/sources.list.d/ansible-ubuntu-ansible-eoan.list && \
    apt-get update && \
    apt-get install ansible -y
##  nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && \
    apt-get install -y nodejs
##  clean apt install
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean
##  add jenkins NNOPASSWD
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    echo "Host *" >> /etc/ssh/ssh_config && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config
USER jenkins
