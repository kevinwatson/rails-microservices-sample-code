FROM ruby:3.0.6

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential \
    protobuf-compiler \
    nodejs \
    vim

WORKDIR /home/root

RUN gem install rails -v 6.1
RUN gem install protobuf


