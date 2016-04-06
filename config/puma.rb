#!/usr/bin/env puma

threads 0, 4
workers 1

bind  "unix:///var/tmp/project.sock"
pidfile "/var/run/puma/project.pid"
environment "production"
stdout_redirect "/var/log/puma/project.log"
