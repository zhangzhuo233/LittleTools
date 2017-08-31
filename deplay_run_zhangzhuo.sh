#!/bin/bash


#judge the purpops_dir is exits?
function dir_exit()
{
    if [ ! -d $PURPOPS_DIR ];then
        mkdir $PURPOPS_DIR
    fi
}

#wget && tar && cp
function download_code()
{
    echo $CODE_WGET
    #exit 1
    rm -rf output
    $CODE_WGET
    cd $BASE_DIR/output/
    tar -zvxf *.tar.gz
    cp -rf $BASE_DIR/output/webroot/static/$MODULENAME $PURPOPS_DIR 
}

function main()
{
    echo $CODE_WGET
    echo $MODULENAME
    echo $PURPOPS_DIR

    set -x
    echo $CODE_WGET
    dir_exit
    download_code
}

BASE_DIR=$PWD
#wget 获取代码产出
CODE_WGET=$1
#模块名 eg. car-act
MODULENAME=$2
#目的目录绝对路径
PURPOPS_DIR=$3
#调用main函数
main
