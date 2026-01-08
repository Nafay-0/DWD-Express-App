FROM node:20-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY . .

RUN adduser -D appuser \
  && chown -R appuser:appuser /usr/src/app

USER appuser

EXPOSE 8080

CMD ["node", "index.js"]