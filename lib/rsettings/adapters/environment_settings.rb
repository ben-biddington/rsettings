class EnvironmentSettings
  require "audible"; include Audible;
  
  def get(name)
    v = ENV[name.value.to_s]
    Setting.new(v).tap{|it| notify_missing(name) if it.missing?}
  end

  private

  def notify_missing(name)
    notify :missing, name
  end
end
