#!/bin/sh

PASS="password"

RAND=$(curl -s http://192.168.0.239/login.cgi | grep "id='rand'" | cut -d"'" -f4)

MERGED=$(paste -d '\0' <(echo -n $PASS | fold -w1) <(echo -n $RAND | fold -w1) | tr -d '\n')

HASH=$(echo -n $MERGED | md5sum | sed 's/...$//')

curl -X POST http://192.168.0.239/login.cgi -d "password=$HASH"

