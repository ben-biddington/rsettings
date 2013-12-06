dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "rsettings", "**", "*.rb")).each {|f| require f}

class Settings
  def configure(&block)
    @config = SettingsConfiguration.new.tap do |conf|
      conf.instance_exec &block if block_given?
    end
  end

  def method_missing(m, *args)
    fail "Only support queries, cannot do <#{m}>" unless args.empty?
    EnvironmentSettings.new.get m
  end
end

class SettingsConfiguration
  def let(opts ={})
    puts "opts => #{opts}"
    (@opts ||= {}).merge opts
  end
end
