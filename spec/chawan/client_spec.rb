require "spec_helper"

describe Chawan::Client do
  let(:client){Chawan::Client.new}
  subject {client}

  describe "initialize" do
    context "without api_key" do
      context "nor default api_key" do
        before {Chawan.config api_key: nil}
        it do
          expect{Chawan::Client.new}.to raise_error Chawan::Error::NoApiKeyError
        end
      end
      context "but with default api_key" do
        before {Chawan.config api_key: "default_key"}
        it {expect{Chawan::Client.new}.not_to raise_error}
      end
    end
  end

  describe "#connection" do
    it {expect(client.connection).to be_a Faraday::Connection}
  end

  describe "#get" do
    before do
      allow(client).to receive(:connection).and_return stubbed_connections
    end
    it {expect(client.get "/#{Chawan::API_VERSION}/rooms").to be_a Chawan::Response}
  end
end
