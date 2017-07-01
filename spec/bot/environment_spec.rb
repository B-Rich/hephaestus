require 'spec_helper'
require "pry"

describe Hephaestus::Bot::Environments do
  describe ".list" do
    it "Should return an instance of type  Hephaestus::Bot::ListEnvironmentsResponse" do
      stub_response = EnvironmentListResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:get).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.list(version:"")).to be_kind_of(Hephaestus::Bot::ListEnvironmentsResponse)
    end
  end

  describe ".add" do
    it "Should return an instance of type  Hephaestus::Bot::Environment" do
      stub_response = EnvironmentResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:post).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.add(version: "", body: "")).to be_kind_of(Hephaestus::Bot::Environment)
    end
  end

  describe ".info" do
    it "Should return an instance of type  Hephaestus::Bot::Environment" do
      stub_response = EnvironmentListResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:get).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.info(version: "", environment_id: "")).to be_kind_of(Hephaestus::Bot::Environment)
    end
  end

  describe ".delete_environment" do
    it "Should return an instance of type  Hephaestus::Bot::DeleteEnvironmentResponse" do
      stub_response = DeleteEnvironmentResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:delete).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.delete_environment({version: "", environment_id: ""})).to be_kind_of(Hephaestus::Bot::DeleteEnvironmentResponse)
    end
  end

  describe ".update" do
    it "Should return an instance of type Hephaestus::Bot::Environment" do
      stub_response = EnvironmentResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:put).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.update({version: "", id: "", body:""})).to be_kind_of(Hephaestus::Bot::Environment)
    end
  end
end

class DeleteEnvironmentResponseExample
  def success?
    true
  end

  def body
   '{
      "environment_id": "{environment_id}",
      "status": "deleted"
    }'
  end
end

class EnvironmentListResponseExample
  def success?
    true
  end

  def body
  '{
      "environments": [
        {
          "environment_id": "ff6c8f79-8fa9-4771-818d-9f22777351a4",
          "name": "Watson News Environment",
          "description": "Watson News cluster environment",
          "created": "2016-12-15T22:29:57.677Z",
          "updated": "2016-12-15T22:29:57.677Z",
          "status": "active",
          "read_only": true
        }
      ]
    }'
  end
end

class EnvironmentResponseExample
  def success?
    true
  end

  def body
   '{
      "environment_id": "2cd8bc72-d737-46e3-b26b-05a58546ae32",
      "name": "test_environment",
      "description": "Test environment\"",
      "created": "2016-11-21T14:50:57.898Z",
      "updated": "2016-11-21T14:50:57.898Z",
      "status": "active",
      "read_only": false,
      "index_capacity": {
        "disk_usage": {
          "used_bytes": 318,
          "total_bytes": 2147483648,
          "used": "0.31 KB",
          "total": "2 GB",
          "percent_used": 0.01
        },
        "memory_usage": {
          "used_bytes": 264536200,
          "total_bytes": 518979584,
          "used": "252.28 MB",
          "total": "494.94 MB",
          "percent_used": 50.97
        }
      }
    }'
  end
end
