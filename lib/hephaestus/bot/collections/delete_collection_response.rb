module Hephaestus
  module Bot
    class DeleteCollectionResponse
      attr_reader :collection_id, :status

      def initialize(attrs = {})
        @collection_id = attrs["collection_id"]
        @status = attrs["status"]
      end
    end
  end
end
