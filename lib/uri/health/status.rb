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

        output_json(responses)
        responses
      end

      def output_json(output)
        Dir.mkdir 'uri-health' unless File.directory? 'uri-health'
        File.open('uri-health/last_run.json', 'w') do |f|
          f.write(output.to_json)
        end
      end

    end

  end

end
