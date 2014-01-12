module Uri

  module Health

    class Status

      def initialize(uris)
        @uris = uris
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
