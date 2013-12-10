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

    Xxx.new(@settings, @config).get m
  end
end

class Xxx
  def initialize(settings, config)
    @settings,@config = settings,config
  end

  def get(m)
    query = m.to_s.end_with? "?"

    m = m.to_s.delete "?" if query

    setting_name = @config.name_for(m)
    
    if query
      setting_name = @config.name_for(m)

      value = Setting.new @settings.get(setting_name)
      
      fail "Unable to convert setting <#{setting_name}> to flag" unless value.truthy?
      
      return value.to_s.downcase === "yes"
    end

    @settings.get(setting_name)    
  end
end
