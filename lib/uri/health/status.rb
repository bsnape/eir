module Uri
  module Health
    class Status

      attr_reader :uris

      def initialize(path_to_yaml)
        @uris = YAML.load_file(path_to_yaml)
      end

      def get_http_response_code(uri)
        RestClient.get(uri).code
      end

      def go
        responses = {}
        @uris.each do |uri|
          responses.merge!({ uri => get_http_response_code(uri) })
        end

        responses
      end

    end
  end
end
