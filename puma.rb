#!/usr/bin/env puma

# start puma with:
# bundle exec puma -C puma.rb

root = "#{Dir.getwd}"
daemonize true
bind "unix://#{root}/tmp/puma/socket"
pidfile "#{root}/tmp/puma/pid"
state_path "#{root}/tmp/puma/state"
stdout_redirect "#{root}/log/sunitblog.stdout.log","#{root}/log/sunitblog.stderr.log", true

rackup "#{root}/config.ru"

threads 4, 8

activate_control_app