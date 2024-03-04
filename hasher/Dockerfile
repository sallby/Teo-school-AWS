FROM ruby:alpine
RUN apk --no-cache add --update build-base curl \
    && gem install sinatra thin \
    && apk del build-base
WORKDIR /app
COPY hasher.rb /app/
RUN rm -rf /var/cache/apk/*
CMD ["ruby", "hasher.rb"]
EXPOSE 80
