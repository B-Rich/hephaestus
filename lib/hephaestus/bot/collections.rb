require 'hephaestus/bot/collections/collection'
require 'hephaestus/bot/collections/list_collections_response'
require 'hephaestus/bot/collections/delete_collection_response'

module Hephaestus
  module Bot
    class Collections < Olimpo::Base
      def self.list(params = {})
        response = get("/environments/#{params[:environment_id]}/collections", query: {version: params[:version], name: params[:name]})
        parsed_response = JSON.parse(response.body)
        return ListCollectionsResponse.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.add(params = {})
        response = post("/environments/#{params[:environment_id]}/collections", query: {version: params[:version]}, body: params[:body], headers: { "Content-Type" => "application/json" })
        parsed_response = JSON.parse(response.body)
        return Collection.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.delete_collection(params = {})
        response = delete("/environments/#{params[:environment_id]}/collections/#{params[:collection_id]}", query: {version: params[:version]})
        parsed_response = JSON.parse(response.body)
        return DeleteCollectionResponse.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.info(params = {})
        response = get("/environments/#{params[:environment_id]}/collections/#{params[:collection_id]}", query: {version: params[:version]})
        parsed_response = JSON.parse(response.body)
        return Collection.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.update(params = {})
        response = put("/environments/#{params[:environment_id]}/collections/#{params[:collection_id]}", query: {version: params[:version]}, body: params[:body])
        parsed_response = JSON.parse(response.body)
        return Collection.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.list_fields(params = {})
        response = put("/environments/#{params[:environment_id]}/collections/#{params[:collection_id]/fields}", query: {version: params[:version]})
        parsed_response = JSON.parse(response.body)
        return ListCollectionFieldsResponse.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end
    end
  end
end
