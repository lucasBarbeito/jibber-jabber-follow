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

#RUN rm -f tmp/pids/server.pid && rails db:create db:migrate && rails s -p 8082 -b '0.0.0.0'
#EXPOSE 8082
