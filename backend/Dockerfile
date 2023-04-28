FROM ruby:3.1.2-bullseye

WORKDIR /usr/src/app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        libmariadb-dev-compat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY backend/Gemfile backend/Gemfile.lock ./
RUN bundle install

COPY . .
