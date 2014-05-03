#!/usr/bin/env puma

# start puma with:
# bundle exec puma -C puma.rb

application_path = '/root/sunitblog'
directory application_path
environment 'production'
daemonize true
pidfile "#{application_path}/tmp/pids/sunitblog.pid"
state_path "#{application_path}/tmp/pids/sunitblog.state"
stdout_redirect "#{application_path}/log/sunitblog.stdout.log","#{application_path}/log/sunitblog.stderr.log"
threads 0, 16
# bind "unix://#{application_path}/tmp/sockets/sunitblog.socket"