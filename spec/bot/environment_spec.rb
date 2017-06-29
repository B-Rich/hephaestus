require 'spec_helper'

describe Hephaestus::Bot::Environments do
  describe ".list" do
    it "Should return an instance of type  Hephaestus::Bot::ListEnvironmentsResponse" do
      stub_response = EnviromentListResponseExample.new
      allow(Hephaestus::Bot::Environments).to receive(:get).and_return(stub_response)
      expect(Hephaestus::Bot::Environments.list(version:"")).to be_kind_of(Hephaestus::Bot::ListEnvironmentsResponse)
    end
  end
end

class EnviromentListResponseExample
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
