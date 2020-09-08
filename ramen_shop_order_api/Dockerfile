#
# docker build -t api .
# docker run -it api /bin/ash
# docker run -p 2300:2300 api hanami server --host=0.0.0.0
#

FROM ruby:2.6-alpine
MAINTAINER s-arikawa <s-arikawa@i3-systems.com>

RUN apk add --no-cache build-base
RUN apk add --no-cache sqlite-dev

WORKDIR /app
COPY . /app

RUN bundle install -j $(nproc) --quiet

RUN bundle exec hanami db create
RUN bundle exec hanami db migrate

EXPOSE 2300
CMD ["bundle", "exec"]
