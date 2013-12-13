class Names
  def initialize
    @opts = {}
  end

  def add(opts={})
    @opts.merge! opts.invert
  end

  def for(setting)
    @opts[setting] || setting
  end
end
