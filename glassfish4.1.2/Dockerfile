FROM java:8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV GLASSFISH_HOME /usr/local/glassfish4
ENV PATH $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN apt-get update && \
    apt-get install -y curl unzip zip inotify-tools && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/glassfish-4.1.2.zip http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip && \
    unzip /tmp/glassfish-4.1.2.zip -d /usr/local && \
    rm -f /tmp/glassfish-4.1.2.zip

EXPOSE 8080 4848 8181

WORKDIR /usr/local/glassfish4

RUN wget http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar -O $GLASSFISH_HOME/glassfish/lib/mysql-connector-java-5.1.34.jar

RUN apt-get -y update && \
    apt-get -y install less vim

COPY ./start_glassfish.sh /usr/local/start_glassfish.sh
COPY ./glassfish-resources.xml /usr/local/glassfish-resources.xml
COPY ./XXX.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy

CMD ["/bin/sh","/usr/local/start_glassfish.sh"]