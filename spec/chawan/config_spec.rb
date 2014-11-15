require "spec_helper"

describe Chawan::Config do
  describe "#with!" do
    let(:config){Chawan::Config.instance}
    let(:original_key){"original_key"}
    let(:modified_key){"modified_key"}
    let(:options){{api_key: modified_key}}

    before {Chawan::Config.instance.api_key = original_key}
    it do
      expect{config.with! options}.to change(config, :api_key)
        .from(original_key).to modified_key
    end
  end
end
