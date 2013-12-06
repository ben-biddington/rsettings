dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "rsettings", "**", "*.rb")).each {|f| require f}

class Settings
  def initialize
    @config = SettingsConfiguration.new
  end

  def configure(&block)
    @config = SettingsConfiguration.new.tap do |conf|
      fail "You have to supply a block" unless block_given?
      conf.instance_exec &block if block_given?
    end
  end

  def method_missing(m, *args)
    fail "Only support queries, cannot do <#{m}>" unless args.empty?

    setting_name = @config.name_for m
    
    EnvironmentSettings.new.get setting_name
  end
end

class SettingsConfiguration
  def let(opts = {})
    _opts.merge! opts.invert
  end

  def name_for(setting)
    _opts[setting] || setting
  end

  private

  def _opts; @opts ||= {}; end
end
