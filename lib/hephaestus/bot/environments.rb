require 'hephaestus/bot/environments/list_environments_response'

module Hephaestus
  module Bot
    class Environments < Olimpo::Base
      def self.list(params = {})
        response = get("/environments", query: {version: params[:version]}, path: params[:name], headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return ListEnvironmentsResponse.new(parsed_response) if response.success?
      end
    end
  end
end
