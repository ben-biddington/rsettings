class SettingsConfiguration
  attr_reader :missing, :settings, :names

  def initialize(&block)
    @missing = FailOnMissing.new
    @settings = EnvironmentSettings.new
    @names = Names.new
    instance_exec &block if block_given?

    @missing.listen_to @settings
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

module Missing
  def listen_to settings
    settings.on :missing do |e,args|
      self.on_missing args.first
    end
  end

  protected

  def on_missing(name); end
end

class IgnoreMissing
  include Missing
end

class FailOnMissing
  include Missing

  protected

  def on_missing(name)
    fail "Setting <#{name}> not found"
  end
end
