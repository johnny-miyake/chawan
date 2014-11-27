require "spec_helper"

describe Chawan do
  describe "VERSION" do
    it {expect(Chawan::VERSION).not_to be nil}
  end

  describe ".config" do
    it {expect(Chawan.config).to be_a Chawan::Config}
  end

  describe ".me" do
    before do
      allow_any_instance_of(Chawan::Client)
        .to receive(:connection).and_return stubbed_connections
    end
    subject {Chawan.me}
    it {is_expected.to be_a Chawan::Me}
    it {expect(subject.account_id).to eq "123"}
  end
end
