# Stage 1: Build the application
FROM node:16.14.0-alpine AS builder
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the production image
FROM node:16.14.0-alpine
WORKDIR /app
COPY --from=builder /app/dist /app
EXPOSE 4000
CMD [ "npm", "start" ]
