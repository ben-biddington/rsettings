class EnvironmentSettings
  require "audible"; include Audible;

  def initialize
    @vars = VariableList.new
  end
  
  def get(name)
    real_name = @vars.name name
    ENV[name.to_s].tap{|it| notify_missing(name) if it.nil?}
  end

  private

  def notify_missing(name)
    notify :missing, name
  end
end

class VariableList
  def name(from)
    from
  end
end
