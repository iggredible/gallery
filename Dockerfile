# Build stage
FROM node:18-alpine as builder
RUN apk add --no-cache libc6-compat
WORKDIR /code
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM node:18-alpine
WORKDIR /code
COPY package*.json ./
RUN npm install --production
COPY --from=builder /code/dist/ ./dist/
RUN ls -la dist/

EXPOSE 8080
ENV PORT=8080
ENV HOST=0.0.0.0

CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "8080"]
