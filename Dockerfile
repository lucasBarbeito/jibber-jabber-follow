FROM ruby:3.0.4-alpine

RUN apk add --update --no-cache --virtual run-dependencies \
		build-base \
		postgresql-client \
		postgresql-dev \
		yarn \
		git \
		tzdata \
		libpq \
		&& rm -rf /var/cache/apk/*
		
WORKDIR /followers

COPY Gemfile Gemfile.lock /followers/ 

RUN bundle install

COPY . /followers/

ENTRYPOINT []

EXPOSE 8082
