#!/bin/bash

TAG=$(echo "2.0.0")

echo $TAG > VERSIONFILE

if [ ${2^^} = "MAJOR" ];
then
    NEW_VERSION=$(cat VERSIONFILE |  awk -F'.' '{++$1} {gsub(" ", ".")} {print $0}')
elif [ ${2^^} = 'MIRROR' ];
then
    NEW_VERSION=$(cat VERSIONFILE |  awk -F'.' '{++$2} {gsub(" ", ".")} {print $0}')
elif [ ${2^^} = 'PATH' ];
then
    NEW_VERSION=$(cat VERSIONFILE |  awk -F'.' '{++$3} {gsub(" ", ".")} {print $0}')
else
    echo 'argument not is valid'
fi


# git push origin
# git push origin $NEW_VERSION

echo $NEW_VERSION