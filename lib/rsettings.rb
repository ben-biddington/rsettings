dir = File.join(File.dirname(__FILE__))

Dir.glob(File.join(dir, "rsettings", "**", "*.rb")).each {|f| require f}

class Settings
  def initialize(&block)
    @conf = SettingsConfiguration.new &block
  end

  def inspect
    @conf.inspect
  end

  def method_missing(m, *args, &block)
    fail "Only support queries, cannot do command <#{m}>" unless args.empty?

    rsettings = RSettings.new(
      :settings => @conf.settings,
      :names => @conf.names
    )

    Probe.new rsettings

    rsettings.find m
  end
end

class Probe
  def initialize(names)
    names.on :finding do |e,args|
      Log.info "[RSettings] Finding setting for <#{args.first}> by name <#{args[1].value}>"
    end
  end
end

class ConsoleLog
  class << self
    def info(what)
      puts "[INFO] #{what}"
    end
  end
end

class DevNullLog
  class << self
    def info(what); end
  end
end

Log = ENV["LOUD"] == "on" ? ConsoleLog : DevNullLog
