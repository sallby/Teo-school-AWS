FROM ruby:2.7.3-alpine3.13 as builder

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

#final
FROM ruby:2.7.3-alpine3.13

RUN addgroup --system hasher \
    && adduser -S -G hasher hasher

WORKDIR /usr/src/app

USER hasher

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --chown=hasher:hasher . .

EXPOSE 80

CMD ["ruby","hasher.rb"]