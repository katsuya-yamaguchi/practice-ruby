FROM nginx:1.19.9-alpine

RUN apk update && \
    rm -rf /var/cache/apk/* && \
    rm -f /etc/nginx/conf.d/default.conf && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY docker/nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/conf/rails.conf /etc/nginx/conf.d/rails.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
