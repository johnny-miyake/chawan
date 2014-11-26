module Chawan
  class Room
    attr_accessor *%w(
      room_id name type role sticky unread_num mention_num mytask_num
      message_num file_num task_num icon_path last_update_time
    )

    def initialize args
      args.each do |name, value|
        if respond_to? name.to_sym
          self.send "#{name}=", value
        end
      end
    end

    class << self
      def all
        client = Chawan::Client.new
        resp = client.get Chawan::EndpointBuilder.new(:rooms).to_ep
        if resp.success?
          rooms = resp.body.each{|r| Chawan::Room.new r}
          Chawan::RoomCollection.new rooms
        else
          raise Chawan::Error::FailureResponseError
            .new "The request failed. The received response body is:\n#{resp.body}"
        end
      end

      def find id
        client = Chawan::Client.new
        resp = client.get Chawan::EndpointBuilder.new(rooms: {id: id}).to_ep
        if resp.success?
          Chawan::Room.new resp.body
        else
          raise Chawan::Error::FailureResponseError
            .new "The request failed. The received response body is:\n#{resp.body}"
        end
      end
    end
  end
end
