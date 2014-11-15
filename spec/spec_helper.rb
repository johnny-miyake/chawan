$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "chawan"

def stubbed_connections
  resps = Faraday::Adapter::Test::Stubs.new do |stub|
    stub.get("/#{Chawan::API_VERSION}/rooms"){|env| [200, {}, "{}"]}
  end
  Faraday.new do |builder|
    builder.adapter :test, resps
  end
end
