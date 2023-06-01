FROM --platform=linux/arm64/v8 node:16
ENV PORT=8080
RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y;

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chmod u+r+x /ecs-app
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 8080

ENTRYPOINT ["npm", "start"]
