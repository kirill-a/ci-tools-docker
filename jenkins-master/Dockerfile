# Start with latest Jenkins image
FROM jenkins/jenkins:lts
MAINTAINER kirill

# Give Jenkins at least 2 GB of memory pool, set time zone to Europe/Moscow instead of UTC, turn off security rules for correct HTML publishing
ENV JAVA_OPTS="-Xmx2048M -Dorg.apache.commons.jelly.tags.fmt.timeZone=Europe/Moscow -Duser.timezone=Europe/Moscow -Dhudson.model.DirectoryBrowserSupport.CSP="

USER jenkins
# Install plugins
RUN install-plugins.sh git windows-slaves

# Setup ssh connection to git. You need to copy your id_rsa file to dir with Dockerfile
# RUN  echo "    IdentityFile /usr/share/jenkins/ref/.ssh/id_rsa" >> /etc/ssh/ssh_config
# COPY id_rsa /usr/share/jenkins/ref/.ssh/id_rsa
# RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /usr/share/jenkins/ref/.ssh/config
# RUN ssh-keyscan 10.0.0.1 >> /usr/share/jenkins/ref/.ssh/known_hosts