module Chawan
  class Client
    attr_reader :connection

    def initialize api_key: nil, api_version: nil
      @api_key = api_key || Chawan.config.api_key
      raise Chawan::Error::NoApiKeyError unless @api_key
      @api_version = api_version || Chawan.config.api_version
      raise Chawan::Error::NoApiVersionError unless @api_version

      default_headers = {
        "X-ChatWorkToken" => Chawan.config.api_key,
        "User-Agent" => "Chawan/#{Chawan::VERSION}"
      }
      @connection = Faraday.new "#{Chawan::API_BASE}", headers: default_headers do |builder|
        builder.request :url_encoded
        builder.adapter Faraday.default_adapter
      end
    end

    def get path
      response = connection.get "/#{Chawan::API_VERSION}/#{path}"
      Chawan::Response.new status: response.status, response_body: response.body
    end

    def post
    end

    def put
    end

    def delete
    end
  end
end
