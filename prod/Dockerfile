FROM node:14-alpine as node

FROM node as build
WORKDIR /src
COPY package.json .
COPY yarn.lock .
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn run build
RUN ls /src


FROM node as final
RUN mkdir -p /home/node/app/dist && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package.json .
COPY yarn.lock .
ARG NODE_ENV
USER node
RUN yarn install --frozen-lockfile
COPY --chown=node:node --from=build /src/build ./dist
EXPOSE 3000
ENTRYPOINT ["node", "./dist/index.js"]