$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "chawan"

RSpec.configure do |config|
  config.before(:suite) do
    Chawan.config api_key: "example_key", api_version: "example_ver"
  end
end

def stubbed_connections
  resps = Faraday::Adapter::Test::Stubs.new do |stub|
    stub.get("/#{Chawan::API_VERSION}/rooms"){|env| [200, {}, "{}"]}
    stub.get("/#{Chawan::API_VERSION}/rooms/1"){|env| [200, {}, '{"room_id": "1", "name": "foo"}']}
    stub.get("/#{Chawan::API_VERSION}/me"){|env| [200, {}, '{"account_id": "123"}']}
  end
  Faraday.new do |builder|
    builder.adapter :test, resps
  end
end
