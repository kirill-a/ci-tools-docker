# Start from bare java 7 image
FROM java:7
MAINTAINER kirill

# Ensure that commands will be run from root user
USER root

# Add gradle ppa to sources, because official repos contain too old version (1.4)
RUN echo "deb http://ppa.launchpad.net/cwchien/gradle/ubuntu trusty main" >> /etc/apt/sources.list

# Add user which jenkins will use to connect to slave
RUN adduser --quiet --home /home/jenkins jenkins
RUN echo "jenkins:jenkins" | chpasswd

# Install openssh server so Jenkins can connect to slave via ssh
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install gradle
RUN apt-get install gradle-2.0 -y --force-yes

# Copy id_rsa to slave, you need to manually place it in same dir with Dockerfile
RUN  echo "    IdentityFile /home/jenkins/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir -p /home/jenkins/.ssh
COPY id_rsa /home/jenkins/.ssh/id_rsa

# Set permissions so jenkins user and his processes would be able to access it
RUN chown jenkins /home/jenkins/.ssh/id_rsa

# Add git to known_hosts w/o confirmation
RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /home/jenkins/.ssh/config
RUN ssh-keyscan 10.0.0.1 >> /home/jenkins/.ssh/known_hosts


WORKDIR /home/jenkins/workspace
RUN chown -R jenkins /home/jenkins/workspace
USER jenkins

# Expose port for Jenkins to connect
EXPOSE 22

# Start ssh daemon
CMD ["/usr/sbin/sshd", "-D"]
