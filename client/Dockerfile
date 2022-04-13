FROM ubuntu:20.04

LABEL author.email="lytrung15901@gmail.com" \
	author.name="KhanhTrung"
	

# Disable waring debconf: delaying package configuration, since apt-utils is not installed
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS="yes"

RUN apt-get update  \
    && apt-get -y install  \
          iputils-ping \
          iproute2  \
          net-tools \
          dnsutils  \
          mtr-tiny  \
          tcpdump   \
          nano      \
    && apt-get clean
    
CMD ["/bin/bash"]
     
   

