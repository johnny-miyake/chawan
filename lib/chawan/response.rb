module Chawan
  class Response
    attr_accessor :status, :body

    def initialize options = {}
      @status = options[:status]
      begin
        @body = JSON.parse (options[:response_body] || "")
      rescue JSON::ParserError => e
        raise Chawan::Error::BrokenJsonError.new e.message
      end
    end

    def success?
      case @status
      when 200..299
        true
      else
        false
      end
    end

    def failure?
      not success?
    end
  end
end
