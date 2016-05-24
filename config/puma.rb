#!/usr/bin/env puma

threads 0, 4
workers 1

bind  "unix:///var/tmp/manifesto.sock"
pidfile "tmp/puma.pid"
stdout_redirect "log/puma.log"

environment "production"
