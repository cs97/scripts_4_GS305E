#!/bin/sh

curl -s http://192.168.0.239/login.cgi | grep "id='rand'" | cut -d"'" -f4
