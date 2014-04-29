FROM ubuntu:14.04

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

ADD overviewer.gpg.asc /root/overviewer.gpg.asc
RUN apt-key add /root/overviewer.gpg.asc
RUN echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y minecraft-overviewer wget

ENV VERSION 1.7.9

RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/${VERSION}.jar -P ~/.minecraft/versions/${VERSION}/

ENTRYPOINT ["overviewer.py"]
CMD ["/srv/minecraft/world", "/var/www"]
