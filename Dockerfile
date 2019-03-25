FROM ubuntu:18.04

# Install Languages
RUN apt-get update && apt-get install software-properties-common -y

# Ruby
RUN apt-get install -y ruby

# Python
RUN \
  apt-get update && \
  apt-get install -y python

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
  apt-get update && \
  apt-get install -y gcc make && \
  apt-get install -y golang

ENV GOROOT /usr/lib/go
ENV GOPATH /usr/src/app
ENV PATH /go/bin:$PATH

# from your command line
ENV LC_ALL=C.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

COPY . GOPATH

WORKDIR GOPATH

RUN javac EmailWriter.java

RUN go run pipe_runner.go
