require 'hephaestus/bot/collections/document_counts'

module Hephaestus
  module Bot
    class Collection
      attr_reader :collection_id, :name, :description, :created, :updated, :stauts, :configuration_id, :language, :document_counts

      def initialize(attrs = {})
        @collection_id = attrs["collection_id"]
        @name = attrs["name"]
        @description = attrs["description"]
        @created = attrs["created"]
        @updated = attrs["updated"]
        @stauts = attrs["stauts"]
        @configuration_id = attrs["configuration_id"]
        @language = attrs["language"]
        @document_counts = DocumentCounts.new(attrs["document_counts"]) if attrs["document_counts"] != nil
      end
    end
  end
end
