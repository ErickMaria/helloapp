#!/bin/bash

TAG=$(git tag -l '[0-9].*' | tail -n1)
IMAGENAME=''

echo $TAG > VERSIONFILE

var=$(<VERSIONFILE)

if [ -z "$var" ]
then
    echo "0.0.1" > VERSIONFILE
    NEWVERSION=$(cat VERSIONFILE)     
else
    if [ ${1^^} = "MAJOR" ];
    then
        NEWVERSION=$(cat VERSIONFILE |  awk -F'.' '{++$1} {gsub(" ", ".")} {print $0}')
    elif [ ${1^^} = 'MIRROR' ];
    then
        NEWVERSION=$(cat VERSIONFILE |  awk -F'.' '{++$2} {gsub(" ", ".")} {print $0}')
    elif [ ${1^^} = 'PATH' ];
    then
        NEWVERSION=$(cat VERSIONFILE |  awk -F'.' '{++$3} {gsub(" ", ".")} {print $0}')
    else
        echo 'argument not is valid'
        rm -f VERSIONFILE
        exit
    fi
fi

rm -f VERSIONFILE

echo $NEWVERSION

# git push origin $(git rev-parse --abbrev-ref HEAD)
git tag $NEWVERSION
# git push origin $NEWVERSION

# FULLINAGENAME=$IMAGENAME:$NEWVERSION

# docker login -u -p
# docker build -t FULLINAGENAME .
# docker push FULLINAGENAME
