#!/bin/bash -x
echo "starting entry script"

exec consul-template -template "nginx.ctmpl:nginx.conf" -consul-addr "consul-server:8500" -log-level debug -exec "$@"
