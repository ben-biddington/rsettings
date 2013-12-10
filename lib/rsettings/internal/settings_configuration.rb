class SettingsConfiguration
  attr_reader :missing

  def initialize
    @missing = FailOnMissing.new
  end

  def let(opts = {})
    _opts.merge! opts.invert
  end

  def when_missing(type)
    @missing = IgnoreMissing.new if type === :ignore 
  end

  def name_for(setting)
    _opts[setting] || setting
  end

  private

  def _opts; @opts ||= {}; end
end

class IgnoreMissing
  def on_missing(name); end
end

class FailOnMissing
  def on_missing(name)
    fail "Setting <#{name}> not found"
  end
end
