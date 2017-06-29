require 'hephaestus/bot/environments/environment'

module Hephaestus
  module Bot
    class ListEnvironmentsResponse
      attr_reader :environments

      def initialize(attrs = {})
        @environments = []
        build_environments(attrs["environments"])
      end

      def build_environments(environments)
        environments.each do |environment|
          @environments << Environment.new(environment)
        end
      end
    end
  end
end
