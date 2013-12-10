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
