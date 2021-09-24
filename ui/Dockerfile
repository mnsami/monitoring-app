FROM node:16-alpine3.11 as builder

WORKDIR /var/www/ui

COPY package.json /var/www/ui/
COPY yarn.lock /var/www/ui/
RUN yarn install

COPY . /var/www/ui

RUN yarn run build
CMD yarn start
