FROM tomcat:alpine
WORKDIR /usr/local/tomcat/webapps/
RUN rm -rf * && mkdir ROOT
COPY demoapp.war /usr/local/tomcat/webapps/demoapp.war
COPY content/index.html ROOT/index.html
