FROM node:12.18.3-alpine3.12
MAINTAINER s-arikawa <s-arikawa@i3-systems.com>

# Install app dependencies
RUN apk update && apk upgrade && apk add git yarn

# Create app directory
WORKDIR /app
COPY . /app
RUN yarn install

# Build app
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

# start command
CMD [ "yarn", "start" ]
