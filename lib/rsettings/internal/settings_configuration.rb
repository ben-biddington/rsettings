class SettingsConfiguration
  attr_reader :missing, :settings, :names

  def initialize
    @missing = FailOnMissing.new
    @settings = EnvironmentSettings.new
    @names = Names.new
  end

  def let(opts = {})
    @names.add opts
  end

  def when_missing(type)
    @missing = IgnoreMissing.new if type === :ignore 
  end

  def with_settings(opts={})
    if opts.is_a? Hash
      @settings = SettingsChain.new(opts[:chain]) if opts[:chain]
    else
      @settings = opts.new
    end
  end
end

class IgnoreMissing
  def on_missing(name); end
end

class FailOnMissing
  def on_missing(name)
    fail "Setting <#{name}> not found"
  end
end
