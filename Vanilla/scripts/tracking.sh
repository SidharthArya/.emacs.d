#!/bin/sh
if  [[ "$(xdo id -a Tracking)" == "" ]];
then
    emacs --config tracking;
fi

