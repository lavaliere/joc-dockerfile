FROM apemberton/jenkins-operations-center

MAINTAINER Tracy Kennedy

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim
RUN printf "AddressFamily inet" >> /etc/ssh/ssh_config 

EXPOSE 8080 22 9990 8888 443 33848

ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]