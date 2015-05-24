#!/bin/bash

picDir="/home/twtwtw/Pictures/Wallpapers/"
tmpDir="/tmp/awesome-wallpapers"
listFile=$tmpDir"/list"
tmpFile=$tmpDir"/.tmp"
curFile=$tmpDir"/.current"

function get_nth_line() {
    echo `sed -n "$1"p $2`
}

function getTotal() {
    echo `cat $tmpFile`
}

function make_unordered() {
    awk 'BEGIN{srand()}{b[rand()NR]=$0}END{for(x in b)print b[x]}' $1 > $2
}

function set_as_wallpaper() {
    picSrc=`get_nth_line $1 $listFile`
    feh --bg-fill $picSrc
    echo $1 > $curFile
}

function getPrevNum() {
    cur=`cat $curFile`
    if [ $cur -gt 1 ]; then # >=
        cur=$[cur-1]
    fi
    echo $cur
}

function getNextNum() {
    cur=`cat $curFile`
    picCnt=`getTotal`
    if [ $cur -ge $picCnt ] ; then # >=
        initialize
    else
        cur=$[cur+1]
    fi
    echo $cur
}

function initialize() {
    if [ ! -d $tmpDir ]; then
        mkdir $tmpDir
    else
        rm $tmpDir -rf
        mkdir $tmpDir
    fi

    find $picDir -maxdepth 5 -type f -name '*.jpg' >> $tmpFile
    find $picDir -maxdepth 5 -type f -name '*.png' >> $tmpFile

    make_unordered $tmpFile $listFile

    #sed -i '1i\'"/home/twtwtw/.config/awesome/wallpaper.jpg" $listFile

    wc -l < $listFile > $tmpFile

    echo "Initialization Finished"
    echo 1 > $curFile
    set_as_wallpaper 1
    set_as_wallpaper 1
}

function next() {
    nextNum=`getNextNum`
    set_as_wallpaper $nextNum
}

function previous() {
    prevNum=`getPrevNum`
    set_as_wallpaper $prevNum
}

function delete() {
    cur=`cat $curFile`
    picSrc=`get_nth_line $cur $listFile`

    sed -i $cur'd' "$listFile"
    gvfs-trash "$picSrc"

    wc -l < $listFile > $tmpFile
    set_as_wallpaper $cur
}

case "$1" in
    "init")
        initialize
        ;;
    "next")
        next
        ;;
    "previous")
        previous
        ;;
    "delete")
        delete
        ;;
    *)
        ;;
esac
