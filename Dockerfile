FROM ruby:2.6.1
FROM java:8
FROM python:3
FROM golang:1.11

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN javac EmailWriter.java

RUN go run pipe_runner.go
