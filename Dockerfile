# first phase:
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Second phase:
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# No need to start, nginx starts itself.