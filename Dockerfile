FROM node:18-alpine
RUN apk update && apk add git imagemagick

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]