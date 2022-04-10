FROM nginx:latest

LABEL author.email="bibichanel@gmail.com" \
	author.name="KhanhTrung"

ENV APP_PATH /nginxProxy
WORKDIR $APP_PATH

RUN sudo unlink /etc/nginx/conf.d/default.conf

#COPY ./reverse-proxy.conf /etc/nginx/sites-available/

#RUN sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

RUN service nginx configtest

RUN service nginx restart

# config file entrypoint.sh
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80
