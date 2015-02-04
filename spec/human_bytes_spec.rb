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

  it "should define a module function named 'human_bytes'" do
    expect(subject).to respond_to(:human_bytes)
    expect(subject.private_instance_methods(false)).to include(:human_bytes)
  end
  
  context ".monkey_patch!(klass)" do
    let(:klass) { Class.new }
    it "should add #human_bytes into klass" do
      expect{subject.monkey_patch!(klass)}.to change{ klass.new.respond_to?(:human_bytes) }.
                                                     from(false).
                                                     to(true)
    end
    specify "klass#human_bytes should call HumanBytes.human_bytes with the first argument set to self" do
      subject.monkey_patch!(klass)
      instance = klass.new
      options = {}
      expect(subject).to receive(:human_bytes).with(instance, options)
      instance.human_bytes(options)
    end
  end

  describe "#human_bytes" do
  end

end
