module Missing
  def get(name) 
    Setting.new nil
  end
end

class IgnoreMissing; include Missing; end

class FailOnMissing
  def get(name); fail "Setting <#{name.value}> not found"; end
end
