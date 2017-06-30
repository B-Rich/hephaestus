require 'hephaestus/bot/collections/collection'

module Hephaestus
  module Bot
    class ListCollectionsResponse
      attr_reader :collections

      def initialize(attrs = {})
          @collections = []
          build_collections(attrs["collections"])
      end

      def build_collections(collections)
          collections.each do |collection|
            @collections << Collection.new(collection)
          end
      end
    end
  end
end
