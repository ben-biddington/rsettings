class SettingsConfiguration
  attr_reader :missing, :settings, :names

  def initialize(&block)
    @names    = Names.new
    @defaults = Defaults.new @names
    @settings = EnvironmentSettings.new

    instance_exec &block if block_given?

    if defaults?
      @settings = SettingsChain.new(@settings, @defaults, tail)
    else
      @settings = SettingsChain.new(@settings, tail)
    end
  end

  def let(opts = {})
    @names.add opts
  end

  def default(name, opts = {})
    fail "Expected the :to option so I can tell what the default value is" unless opts[:to]
    @defaults.add name, opts[:to]
  end

  def when_missing(type)
    @tail = IgnoreMissing if type === :ignore 
  end

  def with_settings(opts={})
    @settings = opts.is_a?(Hash) ? SettingsChain.new(opts[:chain].map{|it| it.new}) : opts.new
  end

  private

  def tail
    @tail || FailOnMissing
  end

  def defaults?; @defaults.any? end
end
