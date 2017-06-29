module Hephaestus
  module Bot
    class MemoryUsage
      attr_reader :used_bytes, :total_bytes, :used, :total, :percent_used

      def initialize(attrs = {})
        @used_bytes = attrs["used_bytes"]
        @total_bytes = attrs["total_bytes"]
        @used = attrs["used"]
        @total = attrs["total"]
        @percent_used = attrs["percent_used"]
      end
    end
  end
end
