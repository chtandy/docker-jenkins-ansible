FROM jenkins/jenkins:lts
USER root
RUN set -eux && \
    apt-get update && \
    apt-get install sudo python software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get install ansible -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    echo "Host *" >> /etc/ssh/ssh_config && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config 
USER jenkins
