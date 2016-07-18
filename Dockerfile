FROM ubuntu:latest

MAINTAINER Maksym Bilenko "sath891@gmail.com"

ENV DOCKER_HOST unix:///var/run/docker.sock
ENV LOGSTASH_URL tcp://logstash:9290

WORKDIR /app/DockerLogstash
RUN apt-get update && apt-get install ruby rubygems ruby-dev make g++ ruby-bundler -y

COPY Gemfile /app/DockerLogstash/Gemfile

RUN bundle install

COPY main.rb /app/DockerLogstash/main.rb

# && apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD ruby main.rb