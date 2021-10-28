FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install nginx -y
RUN rm -rf /var/www/html
ADD ./html/ /var/www/html
RUN rm -f /etc/nginx/sites-enabled/*
ADD ./nginx/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
EXPOSE 80:80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
