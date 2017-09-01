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
    echo "=========================wget==========================="
    echo $CODE_WGET
    rm -rf output
    $CODE_WGET
    cd $BASE_DIR/output/
    echo "=========================tar==========================="
    tar -zvxf *.tar.gz
    echo "=========================cp==========================="
    cp -rf $BASE_DIR/output/webroot/static/$MODULENAME/* $PURPOPS_DIR 
}

function local_config()
{
    cd $PURPOPS_DIR 
    echo "=========================sed==========================="
    grep -r "$before" $PURPOPS_DIR --color
#    exit 1
    sed -i "s#$before#$after#g"  `grep $before -rl ./` 
    echo "=========================ensure your result==========================="
    grep -r "$after" $PURPOPS_DIR --color
    echo "===================================================================>"
}

function main()
{
    echo "===================================================================>"
    echo "=========================ensure your para==========================="
    echo $CODE_WGET
    echo $MODULENAME
    echo $PURPOPS_DIR
    echo $before
    echo $after
    echo "===================================================================>"

    #exit 1
    set -x
    echo $CODE_WGET
    dir_exit
    download_code
    local_config
}

BASE_DIR=$PWD
#wget 获取代码产出
CODE_WGET=$1
#模块名 eg. car-act
MODULENAME=$2
#目的目录绝对路径
PURPOPS_DIR=$3
#线上地址
before=$4
#替换后的地址
after=$5
#调用main函数
main
