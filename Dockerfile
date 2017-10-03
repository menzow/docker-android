FROM java:openjdk-8-jdk
MAINTAINER hello@menzo.io

ENV JAVA8_HOME /usr/lib/jvm/default-jvm
ENV JAVA_HOME $JAVA8_HOME

ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ZIP "https://dl.google.com/android/repository/sdk-tools-linux-3952940.zip"

ENV PATH $ANDROID_HOME/tools:$PATH
ENV PATH $ANDROID_HOME/platform-tools:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

ADD packages.txt /root/packages.txt
ADD build.sh /root/build.sh

RUN /bin/bash /root/build.sh