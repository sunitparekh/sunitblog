#!/usr/bin/env puma

# start puma with:
# bundle exec puma -C puma.rb

system('export google_analytics_application_name_sunitblog=sunitparekh.in')
system('export google_analytics_tracking_id_sunitblog=UA-49663495-1')
system('export disqus_shortname_sunitblog=sunitblog')
system('export HOST_NAME=www.sunitparekh.in')

root = "#{Dir.getwd}"
environment 'production'
daemonize true
pidfile "#{root}/tmp/puma/pid"
state_path "#{root}/tmp/puma/state"
stdout_redirect "#{root}/log/sunitblog.stdout.log","#{root}/log/sunitblog.stderr.log", true
#bind "unix://#{root}/tmp/puma/socket"

rackup "#{root}/config.ru"

threads 4, 8

activate_control_app