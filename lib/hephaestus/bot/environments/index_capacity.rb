require 'hephaestus/bot/environments/disk_usage'
require 'hephaestus/bot/environments/memory_usage'

module Hephaestus
  module Bot
    class IndexCapacity
      attr_reader :disk_usage, :memory_usage

      def initialize(attrs = {})
        @disk_usage = DiskUsage.new(attrs["disk_usage"]) if attrs["disk_usage"] != nil
        @memory_usage = MemoryUsafe.new(attrs["memory_usage"]) if attrs["memory_usage"] != nil
      end
    end
  end
end
