FROM node:16-alpine AS builder  
WORKDIR /app
COPY package*.json ./           
RUN npm ci 
COPY . .                        
RUN npm run build                

FROM node:16-alpine AS runner
WORKDIR /app
COPY --from=builder /app /app   
EXPOSE 4000
CMD [ "npm", "start" ]