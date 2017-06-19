#!/bin/bash

sed -i -e 's/PORT = "8080",/PORT = "80",/g' /root/webtob/config/http.m

wscfl -i /root/webtob/config/http.m > /root/automation/portal_web/httpmlog
