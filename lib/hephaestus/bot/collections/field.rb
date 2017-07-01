module Hephaestus
  module Bot
    class Field
      attr_reader :field, :type

      def initialize(attrs = {})
        @field = attrs["field"]
        @type = attrs["type"]
      end
    end
  end
end
