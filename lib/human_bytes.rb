require "human_bytes/version"

module HumanBytes
  PREFIXES =  [
    {
      B: 1,
      Ki: 2**10,
      Mi: 2**20,
      Gi: 2**30,
      Ti: 2**40,
      Pi: 2**50,
      Ei: 2**60,
      Zi: 2**70,
      Yi: 2**80
    },
    {
      B: 1,
      K: 10**3,
      M: 10**6,
      G: 10**9,
      T: 10**12,
      P: 10**15,
      E: 10**18,
      Z: 10**21,
      Y: 10**24,
    }
  ]
  B = 1
  PREFIXES.each do |prefix_set|
    prefix_set.each_pair do |prefix,value|
      self.const_set(prefix,value) unless prefix == :B
    end
  end

  def human_bytes(byte_size, opts={})
  end
  module_function :human_bytes

  def self.monkey_patch!(klass)
    klass.class_eval %Q{
      def human_bytes
      end
    }
  end
end
