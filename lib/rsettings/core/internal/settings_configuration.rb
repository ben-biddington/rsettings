class SettingsConfiguration
  attr_reader :missing, :settings, :names

  def initialize(&block)
    @missing  = FailOnMissing.new
    @names    = Names.new
    @defaults = Defaults.new
    @settings = EnvironmentSettings.new

    instance_exec &block if block_given?

    @settings = defaults? ? DefaultSettings.new(@settings, @defaults) : @settings

    @missing.listen_to @settings
  end

  def let(opts = {}); @names.add opts; end

  def default(name, opts = {})
    fail "Expected the :to option so I can tell what the default value is" unless opts[:to]
    @defaults.add name, opts[:to]
  end

  def when_missing(type)
    @missing = IgnoreMissing.new if type === :ignore 
  end

  def with_settings(opts={})
    @settings = opts.is_a?(Hash) ? SettingsChain.new(opts[:chain]) : opts.new
  end

  private

  def defaults?; @defaults.any? end
end

class DefaultSettings
  require "audible"; include Audible;

  def initialize(settings, defaults)
    @settings,@defaults = settings,defaults
  end

  def get(setting)
    value = @settings.get(setting)
    
    return value.missing? ? @defaults.get(setting) : value
  end
end

class Defaults
  def get(setting)
    defaults[setting.value.to_s]
  end

  def add(name, value)
    defaults[name.to_s] = value
  end

  def any?; false == defaults.empty? end 

  private

  def defaults; @defaults ||= {}; end
end
