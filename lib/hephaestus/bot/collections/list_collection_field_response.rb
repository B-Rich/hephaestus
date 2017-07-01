require 'hephaestus/bot/collections/fields'

module Hephaestus
  module Bot
    class ListCollectionFieldsResponse
      attr_reader :fields

      def initialize(attrs = {})
        @fields = []
        build_fields(attrs["fields"])
      end

      def build_fields(fields)
        fields.each do |field|
          @fields << Field.new(field)
        end
      end
    end
  end
end
