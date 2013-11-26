dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "settings", "*.rb")).each {|f| include f}

class Settings
  class << self
    def name; ENV["name"]; end
  end
end
