class BasicDiskSettings
  require "fileutils"; include FileUtils
  require "audible"; include Audible

  def initialize(&block)
    @file = ".rsettings"
    _ensure
    instance_eval &block if block_given?
  end

  def clear
    rm file
  end

  def set(opts ={})
    require "yaml"

    File.open file, "w+" do |io|
      io.puts opts.to_yaml
    end 
  end

  def get(name)
    require "yaml"
    opts = YAML.load(IO.read(@file))
    opts[name].tap do |result|
      notify_missing name unless result
    end
  end

  private

  def notify_missing(name)
    notify :missing, name
  end

  def _ensure
    touch file
  end

  def file; @file; end
end
