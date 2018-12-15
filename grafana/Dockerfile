FROM resin/rpi-raspbian:stretch
MAINTAINER Gert van Eikeren <gvaneikeren@gmail.com>

ENV GRAFANA_URL="https://github.com/fg2it/grafana-on-raspberry/releases/download/${REPO_TAG}/grafana-${PKG_NAME}.linux-armhf.tar.gz" \
    PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_DATA="/var/lib/grafana" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_LOGS="/var/log/grafana" \
    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"


RUN sudo apt-get update &&\
    sudo apt-get install apt-transport-https curl &&\
    curl https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add - &&\
    echo "deb https://dl.bintray.com/fg2it/deb-rpi-1b stretch main" | sudo tee -a /etc/apt/sources.list.d/grafana.list &&\
    sudo apt-get update &&\
    sudo apt-get install grafana 
        

EXPOSE 3000

WORKDIR /
CMD [ "grafana-server", "--homepath=/usr/share/grafana" , "--config=/etc/grafana/grafana.ini"]
