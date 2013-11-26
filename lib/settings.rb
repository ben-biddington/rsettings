dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "settings", "**", "*.rb")).each {|f| require f}

class Settings
  class << self
    require "forwardable"; extend Forwardable
    delegate :name => EnvironmentSettings
  end
end
