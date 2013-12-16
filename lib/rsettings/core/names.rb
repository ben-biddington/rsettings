class Names
  require "audible"; include Audible
  
  def initialize
    @opts = {}
  end

  def add(opts={})
    notify :adding, opts
    @opts.merge!(opts.invert)
  end

  def for(setting)
    notify :finding, setting
    @opts[setting.to_s] || @opts[setting.to_sym] || setting
  end

  def reverse_for(name)
    @opts.invert[name.value] || name.value
  end
end
