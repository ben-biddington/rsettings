class RSettings
  def initialize(opts={})
    @settings,@names = opts[:settings],opts[:names] 
  end

# todo: eliminate the need for names lookup -- the thing must know itself what name to use

  def find(m)
    query = m.to_s.end_with? "?"

    m = m.to_s.delete "?" if query

    setting_name = SettingName.new(@names, m)
    
    if query
      value = Setting.new @settings.get(setting_name.to_s)
      
      fail "Unable to convert setting <#{setting_name}> to flag" unless value.truthy?
      
      return value.to_s.downcase === "yes"
    end

    @settings.get(setting_name.to_s)    
  end
end

class SettingName
  def initialize(names, name)
    @name,@names = name,names
  end
  
  def to_s
    @names.for @name
  end
end
