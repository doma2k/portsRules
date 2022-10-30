#!/bin/bash

filename='ports.txt'
ufw='ufw allow'

sudo apt install lsof
sudo lsof -i -P -n | grep LISTEN | sed -n 's/.*:\($*\)/\1/p' | grep -Eo "\b[0-9]+\b" >> ports.txt

while read p; do 
    $ufw $p
done < "$filename"

rm ports.txt

sudo ufw enable 
