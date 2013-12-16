class RSettings
  require "audible"; include Audible

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

    notify :finding, m, name

    @settings.get(name).to_s    
  end
end
