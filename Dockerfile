FROM apemberton/jenkins-operations-center

MAINTAINER Tracy Kennedy

USER root
RUN apt-get -y install ntp
RUN ntpd -gq
RUN /etc/init.d/ntp start

USER jenkins
ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]