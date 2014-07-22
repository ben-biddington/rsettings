class BasicDiskSettings
  require "fileutils"; include FileUtils
  require "audible"; include Audible
  require "yaml"

  def initialize(&block)
    @file = ".rsettings"
    _ensure
    instance_eval &block if block_given?
  end

  def clear
    rm file if exists?
  end

  def set(opts ={})
    opts = all.merge opts

    File.open file, "w+" do |io|
      io.puts opts.to_yaml
    end 

    notify :set, @settings
  end

  def get(name)
    Setting.new(settings[name.value]).tap{|result| notify_missing name if result.missing?}
  end

  def file; @file; end

  private

  def settings; @settings ||= all; end

  def all
    return {} unless exists?

    YAML.load(IO.read(file)) || {}
  end

  def notify_missing(name)
    notify :missing, name
  end

  def exists?; File.exists? file; end

  def _ensure
    touch file
  end
end
