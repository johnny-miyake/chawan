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
  end
end

require "chawan/endpoint_builder"
require "chawan/client"
require "chawan/response"
require "chawan/room"
require "chawan/room_collection"
