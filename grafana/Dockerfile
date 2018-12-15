FROM resin/rpi-raspbian:stretch
MAINTAINER Gert van Eikeren <gvaneikeren@gmail.com>


RUN sudo apt-get update &&\
    sudo apt-get install apt-transport-https curl &&\
    curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add - &&\
    echo "deb https://dl.bintray.com/fg2it/deb-rpi-1b stretch main" | sudo tee -a /etc/apt/sources.list.d/grafana.list &&\
    sudo apt-get update &&\
    sudo apt-get install grafana 
        

EXPOSE 3000

COPY ./run.sh /run.sh

WORKDIR /
CMD [ "/run.sh" ]
