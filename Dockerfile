From node:alpine:3.10 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

From nginx
COPY --from=0 /app/build /usr/share/nginx/html
