FROM vulnerables/web-dvwa:latest

LABEL author.email="lytrung15901@gmail.com" \
	author.name="KhanhTrung"

# Disable waring debconf: delaying package configuration, since apt-utils is not installed
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS="yes"

RUN apt-get update -y; exit 0
RUN apt-get install -y tcpdump

EXPOSE 80
