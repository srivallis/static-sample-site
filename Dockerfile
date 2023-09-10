# Dockerfile

FROM node:14-alpine as stage


ENV APP_DIR=/sample-site/
WORKDIR /sample-site/
COPY package*.json /sample-site/
RUN npm install
EXPOSE 4000

FROM stage as development
ENV NODE_ENV=development
CMD node app.js

FROM stage as production
ENV NODE_ENV=production
COPY . /sample-site/
CMD node app.js
