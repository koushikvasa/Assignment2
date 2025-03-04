FROM tomcat:9.0-jdk15
# Copy website files into the container
COPY survey.war /usr/local/tomcat/webapps/
