#/usr/bin/env bash

USER_SERVER="root@yourserver"
UPLOAD_DIRECTORY="/local/path/to/the/folder"
SERVER_DIRECTORY="/backup/path/on/the/server"

if [ $1x == "clean"x ];then
    nowDate=$(date "+%Y_%m_%d")
    echo "Cleaning remote packages before $nowDate."
    cleanfiles=`ssh $USER_SERVER "cd $SERVER_DIRECTORY && ls | grep -v $nowDate-"`
    for tf in $cleanfiles;do
        ssh $USER_SERVER "cd $SERVER_DIRECTORY && rm -v $tf"
    done
    echo "done."
    exit 0
fi

if [ $1x == "cleanall"x ];then
    echo "Cleaning all the remote packages."
    cleanfiles=`ssh $USER_SERVER "cd $SERVER_DIRECTORY && ls"`
    for tf in $cleanfiles;do
        ssh $USER_SERVER "cd $SERVER_DIRECTORY && rm -v $tf"
    done
    echo "done."
    exit 0
fi

upload() {
    nowTime=$(date "+%Y_%m_%d-%H_%M_%S")
    echo "Uploading files at $nowTime."
    tmpfile=$nowTime.tar.gz
    tar zcfP $tmpfile $UPLOAD_DIRECTORY
    ssh $USER_SERVER "mkdir -p $SERVER_DIRECTORY"
    scp ./$tmpfile $USER_SERVER:$SERVER_DIRECTORY
    rm ./$tmpfile
    echo "done."
}

upload
