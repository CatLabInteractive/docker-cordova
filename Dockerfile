FROM beevelop/cordova:v2021.04.1

ADD cordova /tmp/cordova

RUN yes | sdkmanager --licenses

RUN apt-get update && apt-get install git -y

RUN for I in \
             extra-android-m2repository \
             extra-android-support \
             extra-google-google_play_services \
             extra-google-m2repository; \
     do echo y | android update sdk --no-ui --all --filter $I; done

WORKDIR "/data"
