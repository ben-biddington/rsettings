dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "settings", "**", "*.rb")).each {|f| require f}

class Settings
  def method_missing(m, *args)
    fail "Only support queries, cannot do <#{m}>" unless args.empty?
    EnvironmentSettings.new.send m
  end
end
