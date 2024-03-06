FROM ruby:alpine

RUN apk --no-cache add --update build-base curl \
    && gem install sinatra thin rackup \
    && apk del build-base

WORKDIR /app
COPY hasher.rb /app/

RUN rm -rf /var/cache/apk/*

CMD ["rackup", "--host", "0.0.0.0", "-p", "80", "hasher.rb"]
