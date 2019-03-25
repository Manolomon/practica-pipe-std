FROM ubuntu:18.04

# Install Languages
RUN apt-get update && apt-get install software-properties-common -y

# Ruby
RUN apt-get install -y ruby

# Python
RUN \
  add-apt-repository ppa:jonathonf/python-3.6 && \
  apt-get install python3.6 -y

# Java
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Go Lang
RUN \
  apt-get -y install golang-1.10 \
    && apt-get clean
    
RUN export GOROOT=/usr/local/go && \
  export GOPATH=$HOME/ && \
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


COPY . /usr/src/app

WORKDIR /usr/src/app

RUN javac EmailWriter.java

RUN go run pipe_runner.go
