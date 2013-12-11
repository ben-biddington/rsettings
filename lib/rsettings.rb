dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "rsettings", "**", "*.rb")).each {|f| require f}

class Settings
  def initialize(&block)
    @conf = SettingsConfiguration.new &block
  end

  def method_missing(m, *args, &block)
    fail "Only support queries, cannot do command <#{m}>" unless args.empty?

    RSettings.new(
      :settings => @conf.settings,
      :missing => @conf.missing,
      :names => @conf.names
    ).find m
  end
end
