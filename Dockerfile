FROM centos:7
MAINTAINER kazunori matsuo
ADD biserver-ce-6.0.0.0-353.zip /tmp
ADD saiku-plugin-p6-3.7.zip /tmp
ADD saiku-chart-plus-vSaiku3-plugin-pentaho.zip /tmp
ADD marketplace-6.0-20150819.090448-788.zip /tmp
RUN yum update -y && yum install -y wget unzip glibc.i686 libgcc_s.so.1 && yum clean all
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jre-8u65-linux-i586.rpm
RUN unzip /tmp/biserver-ce-6.0.0.0-353.zip
RUN unzip /tmp/saiku-plugin-p6-3.7.zip -d biserver-ce/pentaho-solutions/system
RUN unzip /tmp/saiku-chart-plus-vSaiku3-plugin-pentaho.zip -d biserver-ce/pentaho-solutions/system
RUN unzip /tmp/marketplace-6.0-20150819.090448-788.zip -d biserver-ce/pentaho-solutions/system
RUN rpm -ivh jre-8u65-linux-i586.rpm
RUN echo 'export CATALINA_OPTS="-Xms2048m -Xmx2048m"' > biserver-ce/tomcat/bin/setenv.sh
