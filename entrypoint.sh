#!/bin/sh 
rm /etc/nginx/conf.d/default.conf

nohup consul-template -config=/etc/nginx/conf.d/consul-template.hcl &

nginx -g 'daemon off;'
