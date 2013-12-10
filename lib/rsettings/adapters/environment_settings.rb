class EnvironmentSettings
  require "audible"; include Audible;
  
  def get(name)
    ENV[name.to_s].tap{|it| notify_missing(name) if it.nil?}
  end

  private

  def notify_missing(name)
    notify :missing, name
  end
end
