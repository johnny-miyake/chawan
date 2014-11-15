module Chawan
  module Error
    class ChawanError < StandardError; end
  end
end

require "chawan/error/no_api_key_error"
require "chawan/error/no_api_version_error"
require "chawan/error/type_mismatch_error"
require "chawan/error/failure_response_error"
require "chawan/error/broken_json_error"
