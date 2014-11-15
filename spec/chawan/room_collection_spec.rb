require "spec_helper"

describe Chawan::RoomCollection do
  let(:room_collection){Chawan::RoomCollection.new}

  describe "#initialize" do
    context "with rooms" do
      let(:rooms){1.upto(3).map{|i| Chawan::Room.new room_id: i}}
      let(:room_collection){Chawan::RoomCollection.new rooms}
      it {expect(room_collection.rooms).to eq rooms}
    end
    context "with no room" do
      let(:room_collection){Chawan::RoomCollection.new}
      it {expect(room_collection.rooms).to eq []}
    end
  end

  describe "#rooms=" do
    let(:assigns){[:foo, :bar]}
    context "when array object is assigned" do
      before do
        room_collection.rooms = assigns
      end
      it {expect(room_collection.rooms).to eq assigns}
    end
    context "when non-array objet is assigned" do
      it do
        expect{room_collection.rooms = "non-array"}
          .to raise_error Chawan::Error::TypeMismatchError
      end
    end
  end

  describe ".each" do
    it {expect(room_collection.each{}).to be room_collection}
  end
end
