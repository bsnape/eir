module Eir
  class Server

    def initialize
      @server_url = 'http://localhost:8700'
    end

    class FailedToStopSinatraError < StandardError
      def message
        'Failed to stop the Sinatra Dashboard!'
      end
    end

    class FailedToStartSinatraError < StandardError
      def message
        'Failed to start the Sinatra Dashboard!'
      end
    end

    def status
      begin
        RestClient.get("#{@server_url}/status").code
      rescue Errno::ECONNREFUSED
        false
      end
    end

    def start
      stop if File.exist? 'server.pid'
      puts "Starting the server at #{@server_url}"
      `bundle exec puma --config #{File.dirname(__FILE__)}/app/puma.rb`
      Timeout.timeout(10, FailedToStartSinatraError) { sleep 1 until status == 200 }
    end

    def stop
      pid = File.read('server.pid').to_i
      puts "Destroying the server process ID: #{pid}"
      `kill -9 #{pid}`
      Timeout.timeout(10, FailedToStopSinatraError) { sleep 1 until status == false }
    end

  end
end
