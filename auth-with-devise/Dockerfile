FROM ruby:3.0.3

ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

COPY Gemfile ${APP_ROOT}
COPY Gemfile.lock ${APP_ROOT}

RUN apt-get update && \
    apt-get install -y postgresql-13 && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install yarn && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    bundle config --global jobs 4 && \
    bundle install && \
    rm -fr /usr/local/bundle/cache/*

COPY . ${APP_ROOT}/

CMD ["puma", "-C", "config/puma.rb"]
