FROM       node:10-alpine as builder
RUN        mkdir /app
COPY       . .
RUN        npm install
WORKDIR    /app
COPY       . .
RUN        npm run build
FROM       nginx:1.16.0-alpine
RUN        mkdir -p /var/www/html/frontend
COPY       --from=builder /app /var/www/html/frontend
COPY       todo-docker.conf /etc/nginx/conf.d/default.conf
CMD        ["nginx", "-g", "daemon off;"]
