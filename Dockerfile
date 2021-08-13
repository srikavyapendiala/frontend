FROM    node:8-alpine as builder
RUN     mkdir -p /frontend
WORKDIR  /frontend
COPY    . /frontend
RUN     npm install
RUN     npm run build
FROM    nginx
RUN     mkdir -p /var/www/html/frontend
COPY    --from=builder /frontend /var/www/html/frontend
COPY    todoshop-docker.conf /etc/nginx/conf.d/default.conf
