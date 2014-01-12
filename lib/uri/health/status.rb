module Uri

  module Health

    class Status

      def initialize(path_to_yaml)
        @uris = YAML.load_file(path_to_yaml)
      end

      def go
        responses = {}
        @uris.each do |uri|
          responses.merge!({uri => HTTParty.get(uri).code})
        end
        responses
      end

    end

  end

end
