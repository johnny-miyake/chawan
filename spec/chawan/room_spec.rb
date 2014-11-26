require "spec_helper"

describe Chawan::Room do
  describe "#initialize" do
    it {expect(Chawan::Room.new room_id: 1).to be_a Chawan::Room}
  end

  describe ".all" do
    before do
      allow_any_instance_of(Chawan::Client)
        .to receive(:connection).and_return stubbed_connections
    end
    it {expect(Chawan::Room.all).to be_a Chawan::RoomCollection}
  end

  describe ".find" do
    before do
      allow_any_instance_of(Chawan::Client)
        .to receive(:connection).and_return stubbed_connections
    end
    subject {Chawan::Room.find 1}
    it {is_expected.to be_a Chawan::Room}
    it {expect(subject.room_id).to eq "1"}
  end
end
