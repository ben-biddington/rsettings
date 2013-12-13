class SettingName
  attr_reader :value

  def initialize(name)
    @value = name
  end
  
  def eql?(other)
    return false if other.nil?
    other.value eqls self.value
  end
end

class ConvertibleSettingName
  def initialize(names, name)
    @name,@names = name,names
  end
  
  def value
    @names.for @name
  end
end
