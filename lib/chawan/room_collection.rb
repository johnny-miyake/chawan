module Chawan
  class RoomCollection
    include Enumerable
    attr_reader :rooms

    def initialize rooms = []
      @rooms = rooms
    end

    def rooms= room_array
      unless room_array.is_a? Array
        raise Chawan::Error::TypeMismatchError.new "rooms must be an Array"
      end
      @rooms = room_array
    end

    def each &block
      rooms.each{|room| yield room} and return self
    end
  end
end
