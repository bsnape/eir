module Uri

  module Health

    class Status

      def initialize(uri)
        @uri = uri
      end

      def go
        HTTParty.get(@uri).code
      end

    end

  end

end
