class DefaultSettings
  require "audible"; include Audible;

  def initialize(settings, defaults)
    @settings,@defaults = settings,defaults
  end

  def get(setting)
    value = @settings.get(setting)
    
    return value.missing? ? @defaults.get(setting) : value
  end
end
