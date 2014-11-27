require "yaml"
require "json"
require "faraday"
require "singleton"
require "chawan/version"
require "chawan/config"
require "chawan/error"

module Chawan
  API_BASE = "https://api.chatwork.com"
  API_VERSION = "v1"

  class << self
    @@config = nil

    def config options = {}
      @@config ||= Chawan::Config.instance
      @@config = @@config.with!(options) unless options.empty?
      @@config
    end

    def me
      client = Chawan::Client.new
      resp = client.get Chawan::EndpointBuilder.new(:me).to_ep
      if resp.success?
        Chawan::Me.new resp.body
      else
        raise Chawan::Error::FailureResponseError
          .new "The request failed. The received response body is:\n#{resp.body}"
      end
    end
  end
end

require "chawan/endpoint_builder"
require "chawan/client"
require "chawan/response"
require "chawan/room"
require "chawan/room_collection"
require "chawan/me"
