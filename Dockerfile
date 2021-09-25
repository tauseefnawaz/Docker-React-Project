FROM node:alpine as builder
WORKDIR '/app'
COPY --chown=node:node package.json .
RUN npm install
COPY --chown=node:node . .
USER node
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html