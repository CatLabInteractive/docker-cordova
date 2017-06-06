FROM beevelop/cordova:latest

ADD cordova /tmp/cordova

RUN cd /tmp/cordova/6.2.3 && cordova platform add android && cordova build android
RUN apt-get update && apt-get install git -y

WORKDIR "/data"