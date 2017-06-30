module Hephaestus
  module Bot
    class DocumentCounts
      attr_reader :available, :processing, :failed

      def initialize(attrs = {})
        @available = attrs["available"]
        @processing = attrs["processing"]
        @failed = attrs["failed"]
      end
    end
  end
end
