class RSettings
  def initialize(settings, config)
    @settings,@config = settings,config
  end

  def find(m)
    query = m.to_s.end_with? "?"

    m = m.to_s.delete "?" if query

    setting_name = @config.name_for(m)
    
    if query
      setting_name = @config.name_for(m)

      value = Setting.new @settings.get(setting_name)
      
      fail "Unable to convert setting <#{setting_name}> to flag" unless value.truthy?
      
      return value.to_s.downcase === "yes"
    end

    @settings.get(setting_name)    
  end
end
