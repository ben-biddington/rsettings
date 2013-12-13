class RSettings
  def initialize(opts={})
    @settings,@names = opts[:settings],opts[:names] 
  end

  def find(m)
    query = m.to_s.end_with? "?"

    m = m.to_s.delete "?" if query

    name = ConvertibleSettingName.new(@names, m)
    
    if query
      value = @settings.get(name)

      fail "Unable to convert setting <#{name.value}> to flag" unless value.truthy?
      
      return value.to_s.downcase === "yes"
    end

    @settings.get(name).to_s    
  end
end

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
