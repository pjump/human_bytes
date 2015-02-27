require "human_bytes/version"
require 'flt'
require 'attach_function'

module HumanBytes
  UNIT_SETS =  [
    {
      B: 1,
      KiB: 2**10,
      MiB: 2**20,
      GiB: 2**30,
      TiB: 2**40,
      PiB: 2**50,
      EiB: 2**60,
      ZiB: 2**70,
      YiB: 2**80
    },
    {
      B: 1,
      KB: 10**3,
      MB: 10**6,
      GB: 10**9,
      TB: 10**12,
      PB: 10**15,
      EB: 10**18,
      ZB: 10**21,
      YB: 10**24,
    }
  ]
  B = 1
  UNIT_SETS.each do |prefix_set|
    prefix_set.each_pair do |prefix,value|
      self.const_set(prefix,value) unless prefix == :B
    end
  end

  ## 
  # places (Integer): number of places after the decimal point
  # i (Boolean): use IT prefixes based on powers of 2 rather than 10

  DEFAULTS = { places: 2, i: true }
  def human_bytes(byte_size, opts={})
    opts = DEFAULTS.merge(opts)
    places = opts[:places]
    i = opts[:i]

    unit_sizes = UNIT_SETS[ i ? 0 : 1]

    last_unit = :B
    unit_sizes.each_pair do |unit,unit_size|
      break if byte_size < unit_size
      last_unit = unit
    end
    last_unit_size = unit_sizes[last_unit]

    qty = (Flt::DecNum(byte_size)/(last_unit_size)).round(places: places)
    "#{qty} #{last_unit}"
  end
  module_function :human_bytes

  module MethodVersion
    extend AttachFunction
    attach_function :human_bytes
  end
end
