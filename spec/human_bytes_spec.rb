require 'spec_helper'

describe HumanBytes do
  it 'has a version number' do
    expect(HumanBytes::VERSION).not_to be nil
  end

  context "Module constants" do

    @decimal_prefixes = %i[K M G T P E Z Y]
    @iprefixes = @decimal_prefixes.map {|p| "#{p}i".to_sym}
    @prefixes = [:B] + @decimal_prefixes + @iprefixes

    @prefixes.each do |prefix|
      it "should define #{prefix}" do
        expect(subject.const_defined?(prefix)).to eq(true)
      end
    end
  end

  describe "#human_bytes" do
    it "should define instance method #human_bytes" do
      expect(subject.instance_methods).to include(:human_bytes)
    end
  end

end
