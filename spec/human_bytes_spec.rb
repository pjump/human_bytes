require 'spec_helper'

describe HumanBytes do
  it 'has a version number' do
    expect(HumanBytes::VERSION).not_to be nil
  end

  context "Module constants" do

    @decimal_prefixes = %i[K M G T P E Z Y]
    @iprefixes = @decimal_prefixes.map {|p| "#{p}i".to_sym}
    @prefixes = [:B] + (@decimal_prefixes + @iprefixes).map {|p| (p.to_s+'B').to_sym }

    @prefixes.each do |prefix|
      it "should define #{prefix}" do
        expect(subject.const_defined?(prefix)).to eq(true)
      end
    end
  end

  it "should define a module function named 'human_bytes'" do
    expect(subject).to respond_to(:human_bytes)
    expect(subject.private_instance_methods(false)).to include(:human_bytes)
  end
  
  context "mixing ig" do
    let(:klass) { Class.new }
    it "should add #human_bytes into klass" do
      expect{klass.include HumanBytes::MethodVersion}.to change{ klass.new.respond_to?(:human_bytes) }.
                                                     from(false).
                                                     to(true)
    end
    specify "klass#human_bytes should call HumanBytes.human_bytes with the first argument set to self" do
      klass.include HumanBytes::MethodVersion
      instance = klass.new
      options = {}
      expect(subject).to receive(:human_bytes).with(instance, options)
      instance.human_bytes(options)
    end
  end

  context ".human_bytes" do
    include HumanBytes
    let(:k) { 1025 }
    let(:opts) { {places: 2, i: true } }
    let!(:format) { /^\d+\.{0,1}\d* [A-Z]i{0,1}B$/ }
    it "should output in the expected format" do
      expect(human_bytes(k, opts)).to match(format)
      expect(human_bytes(k, places: 0, i: true)).to match(format)
      expect(human_bytes(k, i: true)).to match(format).and match(/i/)
      expect(human_bytes(k, i: false)).to match(format).and match(/^[^i]*$/)
    end
    it 'should print the correct number of decimal places' do
      expect(human_bytes(k, places: 2)).to match(/.\d{2} /)
      expect(human_bytes(k, places: 5)).to match(/.\d{5} /)
    end
  end
end
