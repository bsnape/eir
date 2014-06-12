GEM_LOCATION      = File.dirname(__FILE__)
CURRENT_DIRECTORY = Dir.pwd

rackup "#{GEM_LOCATION}/config.ru"
pidfile "#{CURRENT_DIRECTORY}/server.pid"
daemonize true

port 8700

stdout_log = "#{CURRENT_DIRECTORY}/access.log"
stderr_log = "#{CURRENT_DIRECTORY}/error.log"
stdout_redirect(stdout_log, stderr_log, true)
