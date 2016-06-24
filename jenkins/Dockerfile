FROM jenkins:1.651.1
MAINTAINER OME

# Temp fix robot test results
ENV JAVA_OPTS "-Dhudson.model.DirectoryBrowserSupport.CSP="

ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8443 --httpsCertificate=/var/jenkins_home/sslcert/server.crt --httpsPrivateKey=/var/jenkins_home/sslcert/server.key

EXPOSE 8443

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
