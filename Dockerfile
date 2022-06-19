FROM node:latest
WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN yarn install
COPY . .
ENV PORT 3000
EXPOSE $PORT
CMD [ "node", "src/index.js" ]