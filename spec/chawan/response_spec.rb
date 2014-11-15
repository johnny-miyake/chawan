require "spec_helper"

describe Chawan::Response do
  describe "#initialize" do
    context "with not-wellformed json" do
      it do
        expect do
          Chawan::Response.new status: 200, response_body: "foo"
        end.to raise_error Chawan::Error::BrokenJsonError
      end
    end
  end

  describe "#success?" do
    let :response do 
      Chawan::Response.new status: 200,
        response_body: %Q({"sample": "response"})
    end
    it do
      expect(
        (200..299).map do |stat|
          response.status = stat
          response.success?
        end.all?
      ).to be true
    end
  end
end
