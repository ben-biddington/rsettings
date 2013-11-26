class EnvironmentSettings
  def initialize
    @vars = VariableList.new
  end
  
  def get(name)
    real_name = @vars.name name
    ENV[name.to_s].tap{|it| fail_because_setting_is_missing(name) if it.nil?}
  end

  private

  def fail_because_setting_is_missing(name)
    fail "Setting <#{name}> not found"
  end
end

class VariableList
  def name(from)
    from
  end
end
