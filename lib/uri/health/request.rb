module Uri
  module Health
    class Request

      attr_reader :server_url
      attr_accessor :uris

      def initialize
        path_to_yaml = find_yaml
        @uris        = validate_yaml path_to_yaml
        @server_url  = 'http://localhost:8700'
      end

      def find_yaml
        if File.exist?("#{Dir.pwd}/uris.yaml")
          uris_yaml_file = "#{Dir.pwd}/uris.yaml"
          puts "Found local YAML file: #{uris_yaml_file}"
        else
          uris_yaml_file = "#{File.dirname(__FILE__)}/default_uris.yaml"
          puts "No local YAML file found. Using default YAML file: #{uris_yaml_file}"
        end
        uris_yaml_file
      end

      def validate_yaml(path_to_yaml)
        invalid_yaml_error = 'YAML structure incorrect. Please refer to the README.'
        yaml               = YAML.load_file path_to_yaml
        raise invalid_yaml_error unless yaml.is_a? Array
        yaml.each { |hash| raise invalid_yaml_error unless hash.is_a? Hash }
        yaml
      end

      def get_http_response_code(uri)
        begin
          Timeout.timeout(5) do
            request(uri).code
          end
        rescue
          false
        end
      end

      def go
        responses = {}
        @uris.each do |uri_name_hash|
          uri_name_hash.each do |uri, name|
            responses.merge!({ name => get_http_response_code(uri) })
          end
        end

        responses
      end

      private

      def request(uri)
        RestClient.get uri
      end

    end
  end
end
