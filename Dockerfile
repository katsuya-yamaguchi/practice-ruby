FROM ruby:3.0.3

ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

COPY Gemfile ${APP_ROOT}
COPY Gemfile.lock ${APP_ROOT}

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/* && \
    bundle install
