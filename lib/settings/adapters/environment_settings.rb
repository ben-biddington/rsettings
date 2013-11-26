class EnvironmentSettings
  def method_missing(name, *args)
    ENV[name.to_s]
  end
end
