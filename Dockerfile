FROM openshift/base-centos7
#FROM jdeathe/centos-ssh
MAINTAINER Oscar Mondragon

RUN yum -y update
RUN wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
RUN yum -y localinstall jdk-8u131-linux-x64.rpm
RUN wget https://github.com/dularion/streama/releases/download/v1.1/streama-1.1.war
RUN mkdir /opt/streama
RUN mv streama-1.1.war /opt/streama/streama.war
RUN mkdir /opt/streama/media
RUN chmod 664 /opt/streama/media 
COPY streama.service /etc/systemd/system/
EXPOSE 8080
CMD ["/bin/java", "-jar", "/opt/streama/streama.war"]
