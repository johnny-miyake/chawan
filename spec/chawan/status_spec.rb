require "spec_helper"

describe Chawan::Status do
  describe "#initialize" do
    it {expect(Chawan::Status.new).to be_a Chawan::Status}
  end

  describe ".mine" do
    before do
      allow_any_instance_of(Chawan::Client)
        .to receive(:connection).and_return stubbed_connections
    end
    subject {Chawan::Status.mine}
    it {expect(subject).to be_a Chawan::Status}
    it {expect(subject.unread_room_num).to eq "10"}
  end
end
