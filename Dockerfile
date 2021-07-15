FROM        nginx
RUN         mkdir -p /var/www/html
COPY        static /var/www/html
COPY        todo-docker.conf /etc/nginx/sites-enabled/default.conf
