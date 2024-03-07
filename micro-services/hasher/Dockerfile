FROM ruby:alpine
RUN apk --no-cache add --update build-base curl
RUN gem install bundler
WORKDIR /app
COPY hasher.rb Gemfile Gemfile.lock /app/
RUN bundle install
RUN rm -rf /var/cache/apk/*
CMD ["ruby", "hasher.rb"]
EXPOSE 80