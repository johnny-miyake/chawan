module Chawan
  class Config
    include Singleton
    attr_accessor :api_key, :api_version

    def with! options = {}
      self.tap do |s|
        s.api_key = options[:api_key]
        s.api_version = options[:api_version] || Chawan::API_VERSION
      end
    end
  end
end
