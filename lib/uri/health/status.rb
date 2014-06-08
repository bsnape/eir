module Uri
  module Health
    class Status

      attr_reader :uris, :server_url

      def initialize(uris_yaml_file = "#{File.dirname(__FILE__)}/default_uris.yaml")
        puts "Loading URI YAML file at path: #{uris_yaml_file}"
        @server_url = 'http://localhost:8700'
        @uris       = YAML.load_file(uris_yaml_file)
      end

      def get_http_response_code(uri)
        RestClient.get(uri).code
      end

      def status
        begin
          RestClient.get("#{@server_url}/status").code
        rescue Errno::ECONNREFUSED
          false
        end
      end

      def go
        responses = {}
        @uris.each do |uri|
          responses.merge!({ uri => get_http_response_code(uri) })
        end

        responses
      end

      def start
        stop
        puts "Starting the server at #{@server_url}"
        `rackup #{File.dirname(__FILE__)}/server/config.ru -P server.pid`
        Timeout.timeout(10) { sleep 1 until status == 200 }
      end

      def stop
        pid = File.read('server.pid').to_i
        puts "Destroying the server process ID: #{pid}"
        `kill -9 #{pid}`
        Timeout.timeout(10) { sleep 1 until status == false }
      end

    end
  end
end
