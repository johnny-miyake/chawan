require "spec_helper"

describe Chawan::Me do
  describe "#initialize" do
    it {expect(Chawan::Me.new).to be_a Chawan::Me}
  end
end
