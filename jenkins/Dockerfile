FROM jenkins:2.32.2
MAINTAINER OME


USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

# Temp fix robot test results
ENV JAVA_OPTS "-Dhudson.model.DirectoryBrowserSupport.CSP="

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
