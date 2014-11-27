module Chawan
  class Status
    attr_accessor *%w(
      unread_room_num mention_room_num mytask_room_num
      unread_num mention_num mytask_num
    )

    def initialize args = {}
      args.each do |name, value|
        if respond_to? name.to_sym
          self.send "#{name}=", value
        end
      end
    end

    class << self
      def mine
        client = Chawan::Client.new
        resp = client.get "/v1/my/status"
        if resp.success?
          Chawan::Status.new resp.body
        else
          raise Chawan::Error::FailureResponseError
            .new "The request failed. The received response body is:\n#{resp.body}"
        end
      end
    end
  end
end
