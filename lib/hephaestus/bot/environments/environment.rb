require 'hephaestus/bot/environments/index_capacity'

module Hephaestus
  module Bot
    class Environment
      attr_reader :environment_id, :name, :description, :created, :updated, :status, :read_only, :size, :index_capacity

      def initialize(attrs = {})
        @environment_id = attrs["environment_id"]
        @name = attrs["name"]
        @description = attrs["description"]
        @created = attrs["created"]
        @updated = attrs["updated"]
        @status = attrs["status"]
        @read_only = attrs["read_only"]
        @size = attrs["size"]
        @index_capacity = IndexCapacity.new(attrs["index_capacity"]) if attrs["index_capacity"] != nil
      end
    end
  end
end
