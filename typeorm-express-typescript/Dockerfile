FROM node:16.14.0-alpine AS builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build

FROM scratch

COPY --from=builder /app/dist /app
EXPOSE 4000
CMD [ "npm", "start" ]