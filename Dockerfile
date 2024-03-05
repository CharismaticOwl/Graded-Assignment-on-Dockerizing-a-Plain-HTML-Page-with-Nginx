FROM nginx:alpine3.18-perl

RUN rm -rf /usr/share/nginx/html/*

RUN rm -rf /etc/nginx/conf.d/*

COPY index.html /usr/share/nginx/html/index.html

COPY new_html.conf /etc/nginx/conf.d/new_html.conf

EXPOSE 80