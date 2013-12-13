class SettingsChain
  require "audible"; include Audible

  def initialize(*links)
    @settings = *links.flatten.map{|klass| klass.new}
  end

  def get(name)
    @settings.each do |setting|
      result = setting.get(name)
      return result unless result.missing?
    end
    
    notify_missing name
  end

  private

  def notify_missing(name)
    notify :missing, name
  end
end 
