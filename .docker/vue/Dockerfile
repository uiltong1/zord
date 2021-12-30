# base image
FROM node:14.18.2-alpine

RUN npm install -g http-server

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./zord-app/package*.json /app/
COPY ./zord-app/ .

RUN yarn
RUN yarn add global @vue/cli

# start app
CMD ["yarn", "serve"]
