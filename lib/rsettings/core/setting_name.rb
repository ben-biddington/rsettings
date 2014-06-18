class SettingName
  attr_reader :value

  def initialize(name)
    @value = name
  end
end

class ConvertibleSettingName
  def initialize(names, name)
    @name,@names = name,names
  end
  
  def value; @names.for(@name) || @name; end
end
