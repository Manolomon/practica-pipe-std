FROM dockerfile/ubuntu

# Install Ruby.
RUN \
  apt-get update && \
  apt-get install -y ruby && \
  add-apt-repository ppa:jonathonf/python-3.6 && \
  apt-get install python3.6 -y && \
  apt-get install software-properties-common -y && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get install oracle-java8-installer && \
  apt-get -y install golang-1.10 \
    && apt-get clean
    
RUN echo 'export PATH="/usr/lib/go-1.10/bin:$PATH"' >> /etc/bash.bashrc

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN javac EmailWriter.java

RUN go run pipe_runner.go
