FROM nginx:latest

LABEL author.email="lytrung15901@gmail.com" \
	author.name="KhanhTrung"

ENV APP_PATH /nginxProxy
WORKDIR $APP_PATH

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./modsecurity.sh $APP_PATH
RUN chmod +x $APP_PATH/modsecurity.sh 

# Disable waring debconf: delaying package configuration, since apt-utils is not installed
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS="yes"

RUN apt-get update -y; exit 0
RUN apt-get install -y tcpdump git wget vim libssl-dev zlib1g-dev

RUN apt install gcc make build-essential autoconf automake libtool libcurl4-openssl-dev liblua5.3-dev libfuzzy-dev ssdeep gettext pkg-config libpcre3 libpcre3-dev libxml2 libxml2-dev libcurl4 libgeoip-dev libyajl-dev doxygen -y

EXPOSE 80
