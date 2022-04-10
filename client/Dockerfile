FROM ubuntu:20.04

LABEL author.email=”khanhtrung<bibichanel@gmail.com” \
	author.name="KhanhTrung"
	
#Install software packages inside the container
RUN apt-get update  \
    && apt-get -y install  \
          iputils-ping \
          iproute2  \
          net-tools \
          dnsutils  \
          mtr-tiny  \
          nano      \
          tcpdump   \
    && apt-get clean
   
CMD [ "/bin/bash"]
