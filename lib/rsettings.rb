dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "rsettings", "**", "*.rb")).each {|f| require f}

class Settings
  def initialize(&block)
    @settings = EnvironmentSettings.new
    @config = SettingsConfiguration.new

    if block_given?
      @config = SettingsConfiguration.new.tap do |conf|
        conf.instance_exec &block
      end
    end

    @settings.on :missing do |e,args|
      @config.missing.on_missing args.first
    end
  end

  def method_missing(m, *args, &block)
    fail "Only support queries, cannot do <#{m}>" unless args.empty?

    setting_name = @config.name_for m
    
    @settings.get(setting_name)
  end
end

class SettingsConfiguration
  attr_reader :missing

  def initialize
    @missing = FailOnMissing.new
  end

  def let(opts = {})
    _opts.merge! opts.invert
  end

  def when_missing(type)
    @missing = IgnoreMissing.new if type === :ignore 
  end

  def name_for(setting)
    _opts[setting] || setting
  end

  private

  def _opts; @opts ||= {}; end
end

class IgnoreMissing
  def on_missing(name); end
end

class FailOnMissing
  def on_missing(name)
    fail "Setting <#{name}> not found"
  end
end
