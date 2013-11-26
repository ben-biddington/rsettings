dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "settings", "**", "*.rb")).each {|f| require f}

class Settings
  class << self
    def method_missing(name, *args)
      fail "Only support queries" unless args.empty?
      EnvironmentSettings.send name.to_sym
    end
  end
end
