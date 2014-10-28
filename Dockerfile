FROM apemberton/jenkins-operations-center

MAINTAINER Tracy Kennedy

USER root
RUN apt-get -y install ntp
RUN ntpd -gq
RUN /etc/init.d/ntp start

USER jenkins
EXPOSE 8080 22 9990 8888 443

ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]