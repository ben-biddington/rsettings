class EnvironmentSettings
  def method_missing(name, *args)
    ENV[name.to_s].tap{|it| ___fail_because_setting_is_missing(name) if it.nil?}
  end

  private

  def ___fail_because_setting_is_missing(name)
    fail "Setting <#{name}> not found"
  end
end
