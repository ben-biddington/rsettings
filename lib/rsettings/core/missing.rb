module Missing
  def get(name) 
    Setting.new nil
  end
end

class IgnoreMissing
  extend Missing
end

class FailOnMissing
  class << self
    def get(name); fail "Setting <#{name.value}> not found"; end
  end
end
