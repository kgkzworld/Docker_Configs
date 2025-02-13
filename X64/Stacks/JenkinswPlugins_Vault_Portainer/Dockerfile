FROM jenkins/jenkins:lts

USER root

# Install required dependencies
RUN apt-get update && apt-get install -y curl

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/ref/plugins.txt)

USER jenkins
