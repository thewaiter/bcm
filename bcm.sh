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
var=$(echo "$input" | awk '{print $(NF - 2) $(NF - 1) $NF}')
var=$(echo "$var" | sed 's/\[//')
var=$(echo "$var" | sed 's/]//')
var=$(echo "$var" | sed 's/(//')
var=$(echo "$var" | sed 's/)//')
 
echo "$var"
case $var in
    14e4:1713)           b43;;
    14e4:4301)           b43;;
    14e4:4306rev02)      b43;;
    14e4:4306rev03)      b43;;
    14e4:4307)           b43;;
    14e4:4311)           b43;;
    14e4:4311rev01)      b43;;
    14e4:4312)           b43;;
    14e4:4313)           b43;;
    14e4:4315)           b43;;
    14e4:4315rev01)      b43;;
    14e4:4318)           b43;;
    14e4:4318rev02)      b43;;
    14e4:4319)           b43;;
    14e4:4320rev02)      b43;;
    14e4:4320rev03)      b43;;
    14e4:4321)           b43;;
    14e4:4324)           b43;;
    14e4:4325)           b43;;
    14e4:4328)           b43;;
    14e4:4328rev03)      bcmwl;;
    14e4:4329)           bcmwl;;
    14e4:432a)           bcmwl;;
    14e4:432b)           bcmwl;;
    14e4:432c)           bcmwl;;
    14e4:432d)           bcmwl;;
    14e4:4331)           b43;;
    14e4:4335)           b43;;
    14e4:4350)           b43;;
    14e4:4353rev01)      b43;;
    14e4:4358)           bcmwl;;
    14e4:4359)           b43;;
    14e4:4360)           b43;;
    14e4:4365)           b43;;
    14e4:4365rev01)      bcmwl;;
    14e4:43a0)           bcmwl;;
    14e4:43a3)           b43;;
    14e4:43barev01)      b43;;
    14e4:43b1)           bcmwl;;
    14e4:43b1rev03)      bcmwl;;
    14e4:43c3rev04)      b43;;
    14e4:4727)           bcmwl;;
    14e4:a962)           b43;;
    *)                   unknown;;
esac
 
