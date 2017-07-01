require 'spec_helper'

describe Hephaestus::Bot::Collections do
  describe '.list' do
    it 'Should return an instance of Hephaestus::Bot::ListCollectionsResponse' do
      stub_response = ListCollectionsResponseExmaple.new
      allow(Hephaestus::Bot::Collections).to receive(:get).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.list(version: "", environment_id: "")).to be_kind_of(Hephaestus::Bot::ListCollectionsResponse)
    end
  end

  describe '.add' do
    it 'Should return an instance of Hephaestus::Bot::Collection' do
      stub_response = CollectionResponseExample.new
      allow(Hephaestus::Bot::Collections).to receive(:post).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.add(version: "", environment_id: "", body: "")).to be_kind_of(Hephaestus::Bot::Collection)
    end
  end

  describe '.delete_collection' do
    it 'Should return an instance of Hephaestus::Bot::DeleteCollectionResponse' do
      stub_response = DeleteCollectionResponseExample.new
      allow(Hephaestus::Bot::Collections).to receive(:delete).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.delete_collection(version: "", environment_id: "", collection_id: "")).to be_kind_of(Hephaestus::Bot::DeleteCollectionResponse)
    end
  end

  describe '.info' do
    it 'Should return an instance of Hephaestus::Bot::Collection' do
      stub_response = CollectionResponseExample.new
      allow(Hephaestus::Bot::Collections).to receive(:get).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.info(version: "", environment_id: "", collection_id: "")).to be_kind_of(Hephaestus::Bot::Collection)
    end
  end

  describe '.update' do
    it 'Should return an instance of Hephaestus::Bot::Collection' do
      stub_response = CollectionResponseExample.new
      allow(Hephaestus::Bot::Collections).to receive(:put).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.update(version: "", environment_id: "", collection_id: "",body: "")).to be_kind_of(Hephaestus::Bot::Collection)
    end
  end

  describe '.list_fields' do
    it 'Should return an instance of Hephaestus::Bot::ListCollectionFieldsResponse' do
      stub_response = CollectionResponseExample.new
      allow(Hephaestus::Bot::Collections).to receive(:put).and_return(stub_response)
      expect(Hephaestus::Bot::Collections.update(version: "", environment_id: "", collection_id: "",body: "")).to be_kind_of(Hephaestus::Bot::ListCollectionFieldsResponse)
    end
  end
end

class DeleteCollectionResponseExample
  def success?
    true
  end

  def body
    '{
      "collection_id": "44e29a9a-47e3-4acd-874b-c7cbe04043f1",
      "status": "deleted"
    }'
  end
end

class ListCollectionsResponseExmaple
  def success?
    true
  end

  def body
   '{
      "collections": [
        {
          "collection_id": "f1360220-ea2d-4271-9d62-89a910b13c37",
          "name": "example",
          "description": "this is a demo collection",
          "created": "2015-08-24T18:42:25.324Z",
          "updated": "2015-08-24T18:42:25.324Z",
          "status": "active",
          "configuration_id": "6963be41-2dea-4f79-8f52-127c63c479b0",
          "language": "en_us"
        }
      ]
    }'
  end
end

class CollectionResponseExample
  def success?
    true
  end

  def body
   '{
      "name": "new_collection",
      "collection_id": "0c08b701-9499-4a9f-9517-e0851635a59c",
      "description": "New collection",
      "created": "2017-02-08T14:18:22.786Z",
      "updated": "2017-02-08T14:18:22.786Z",
      "configuration_id": "654573b2-b02a-472c-a345-28498eb0b77e",
      "language": "en_us",
      "status": "active"
    }'
  end
end
