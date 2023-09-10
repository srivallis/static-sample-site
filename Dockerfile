# Dockerfile

FROM node:14-alpine as stage


ENV APP_DIR=/sample-site/
WORKDIR ${APP_DIR}
COPY package*.json ${APP_DIR}
RUN npm install
EXPOSE 4000

FROM stage as development
ENV NODE_ENV=development
CMD node app.js

FROM stage as production
ENV NODE_ENV=production
COPY . /${APP_DIR}/
CMD node app.js
