FROM beevelop/cordova:v6.4.0

ADD cordova /tmp/cordova

RUN cd /tmp/cordova/6.4.0 && cordova platform add android && cordova build android
RUN apt-get update && apt-get install git -y

RUN for I in \
             extra-android-m2repository \
             extra-android-support \
             extra-google-google_play_services \
             extra-google-m2repository; \
     do echo y | android update sdk --no-ui --all --filter $I ; done

WORKDIR "/data"