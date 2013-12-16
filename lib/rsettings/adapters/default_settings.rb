class DefaultSettings
  def initialize(defaults)
    @defaults = defaults
  end

  def get(setting)
    Setting.new(@defaults.get(setting))
  end
end
