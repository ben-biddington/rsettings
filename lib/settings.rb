dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "settings", "*.rb")).each {|f| include f}
