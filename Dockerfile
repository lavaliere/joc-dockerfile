FROM lavaliere/jenkins-base

MAINTAINER Tracy Kennedy

# Download jenkins-oc.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://nectar-downloads.cloudbees.com/jenkins-operations-center/latest/latest/jenkins-oc.war"

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install vim
RUN printf "AddressFamily inet" >> /etc/ssh/ssh_config 

EXPOSE 8080 22 9990 8888 443 33848

ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]