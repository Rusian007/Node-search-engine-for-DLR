FROM ruby:3.0.5
RUN apt-get update && \
    apt-get install -y nodejs \
                       build-essential \
                       libxml2-dev \
                       libxslt-dev \
                       libmemcached-dev \
                       cmake \
                       postgresql-client \
                       libpq-dev \
                       libsqlite3-dev \
                       memcached
RUN gem install bundler
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .
COPY start.sh .
RUN chmod +x start.sh
RUN  bin/rails db:migrate
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
