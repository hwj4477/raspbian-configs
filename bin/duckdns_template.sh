#!/bin/sh

#
# duckdns_template.sh
#
# by hwj4477@gmail.com
#
# last update 2015.11.25
#
# usage : http://www.duckdns.org
#


DOMAIN=""
TOKEN=""

curl "https://www.duckdns.org/update?domains=${DOMAIN}&token=${TOKEN}&ip="
