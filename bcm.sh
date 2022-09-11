#!/bin/bash
 
b43 () {
   sudo apt purge bcmwl-kernel-source
   sudo apt install firmware-b43-installer && sudo apt install linux-firmware
}
 
bcmwl () {
   sudo apt purge firmware-b43-installer
   sudo apt install bcmwl-kernel-source
}
 
unknown () {
   echo 'Unidentified Wifi card. Please check Bodhi wiki!'
}
 
input=$(lspci -nn -d 14e4:)
var=$(echo "$input" | awk -F"14e4:" '{print $2}')

var=$(echo "${var// /}")
var=$(echo "${var//]/}")
var=$(echo "${var//(/}")
var=$(echo "${var//)/}")

echo "$var"
case $var in
    1713)           b43;;
    4301)           b43;;
    4306rev02)      b43;;
    4306rev03)      b43;;
    4307)           b43;;
    4311)           b43;;
    4311rev01)      b43;;
    4312)           b43;;
    4313)           b43;;
    4315)           b43;;
    4315rev01)      b43;;
    4318)           b43;;
    4318rev02)      b43;;
    4319)           b43;;
    4320rev02)      b43;;
    4320rev03)      b43;;
    4321)           b43;;
    4324)           b43;;
    4325)           b43;;
    4328)           b43;;
    4328rev03)      bcmwl;;
    4329)           bcmwl;;
    432a)           bcmwl;;
    432b)           bcmwl;;
    432c)           bcmwl;;
    432d)           bcmwl;;
    4331)           b43;;
    4335)           b43;;
    4350)           b43;;
    4353rev01)      b43;;
    4358)           bcmwl;;
    4359)           b43;;
    4360)           b43;;
    4365)           b43;;
    4365rev01)      bcmwl;;
    43a0)           bcmwl;;
    43a3)           b43;;
    43barev01)      b43;;
    43b1)           bcmwl;;
    43b1rev03)      bcmwl;;
    43c3rev04)      b43;;
    4727)           bcmwl;;
    a962)           b43;;
    *)                   unknown;;
esac
 
