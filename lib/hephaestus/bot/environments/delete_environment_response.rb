module Hephaestus
  module Bot
    class DeleteEnvironmentResponse
      attr_reader :environment_id, :status

      def initialize(attrs = {})
        @environment_id = attrs["environment_id"]
        @status = attrs["status"]
      end
    end
  end
end
