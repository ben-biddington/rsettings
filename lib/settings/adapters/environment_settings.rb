class EnvironmentSettings
  class << self
    def method_missing(name, *args)
      ENV[name.to_s]
    end
  end
end
