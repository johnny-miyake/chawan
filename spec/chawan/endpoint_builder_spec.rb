require "spec_helper"

describe Chawan::EndpointBuilder do
  let(:builder){Chawan::EndpointBuilder.new params}

  describe "#initialize" do
    context "with a symbol" do
      let(:params){:foo}
      it {expect(builder.path_struct).to eq({params.to_s => {}})}
    end
    context "with a string" do
      let(:params){"foo"}
      it {expect(builder.path_struct).to eq({params => {}})}
    end
    context "with a nested param" do
      let(:params){{foo: {id: 1}}}
      it {expect(builder.path_struct).to eq params}
    end
    context "with a nested param with string keys" do
      let(:params){{"foo" => {"id" => 1}}}
      it {expect(builder.path_struct).to eq params}
    end
  end

  describe "#uri" do
    context "for single resource" do
      let(:params){{foo: {id: 1}}}
      it {expect(builder.to_ep).to eq "/#{Chawan::API_VERSION}/foo/1"}
    end

    context "for nested resource" do
      let(:params){{foo: {id: 1, bar: {id: 2}}}}
      it {expect(builder.to_ep).to eq "/#{Chawan::API_VERSION}/foo/1/bar/2"}
    end
  end
end
