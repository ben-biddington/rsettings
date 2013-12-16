class SettingsChain
  def initialize(*links)
    @settings = *links.flatten
  end

  def link(link)
    @settings << link
  end

  def get(name)
    @settings.each do |setting|
      result = setting.get(name)
      return result unless result.missing?
    end

    Setting.new nil
  end
end 
