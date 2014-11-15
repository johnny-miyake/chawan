require "spec_helper"

describe Chawan do
  describe "VERSION" do
    it {expect(Chawan::VERSION).not_to be nil}
  end

  describe ".config" do
    it {expect(Chawan.config).to be_a Chawan::Config}
  end
end
