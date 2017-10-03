#!/bin/bash
[ -d $ANDROID_HOME ] || mkdir -p $ANDROID_HOME
curl -L $ANDROID_SDK_ZIP -o sdk.zip
unzip sdk.zip -d $ANDROID_HOME && rm sdk.zip
mkdir -p /root/.android
touch /root/.android/repositories.cfg

yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

if [ -f /root/packages.txt ] && [ ! -z "$(cat /root/packages.txt | sed -r 's/^\n//g')" ]
	then
		yes | $ANDROID_HOME/tools/bin/sdkmanager --include_obsolete `cat /root/packages.txt | tr "\n" " "`;
fi