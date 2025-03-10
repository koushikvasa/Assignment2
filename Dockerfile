#1. Kavya Shivakumar (G01520934)
#2. Sehaj Gill (G01535820)
#3. Jaanaki Swaroop P(G01502869)
#4. Koushik Vasa (G01480627)
FROM tomcat:9.0-jdk15
# Copy website files into the container
COPY survey.war /usr/local/tomcat/webapps/
