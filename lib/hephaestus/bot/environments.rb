require 'hephaestus/bot/environments/list_environments_response'
require 'hephaestus/bot/environments/environment'
require 'hephaestus/bot/environments/delete_environment_response'

module Hephaestus
  module Bot
    class Environments < Olimpo::Base
      def self.list(params = {})
        response = get("/environments", query: {version: params[:version]}, path: params[:name], headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return ListEnvironmentsResponse.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.add(params = {})
        response = post("/environments", query: {version: params[:version]}, body: params[:body].to_json, headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return Environment.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.info(params = {})
        response = get("/environments/#{params[:id]}", query: {version: params[:version]}, headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return Environment.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.delete_environment(params = {})
        response = delete("/environments/#{params[:id]}", query: {version: params[:version]}, headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return DeleteEnvironmentResponse.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.update(params = {})
        response = put("/environments/#{params[:id]}", query: {version: params[:version]}, body: params[:body].to_json, headers: { "Content-Type" => "application/json" } )
        parsed_response = JSON.parse(response.body)
        return Environment.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end
    end
  end
end
