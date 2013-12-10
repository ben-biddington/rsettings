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
  end

  def method_missing(m, *args, &block)
    fail "Only support queries, cannot do <#{m}>" unless args.empty?

    RSettings.new(@settings, @config).find m
  end
end
