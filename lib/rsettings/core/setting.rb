class Setting
  def truthy?; @truthy; end
  
  def initialize(text="")
    @text = text
    @truthy = (text||"").downcase.match /(yes|no|on|off)/
  end

  def missing?; @text.nil?; end

  def to_s; @text.to_s; end
  
  def true?
    match = (@text||"").downcase.match(/(yes|on)/)
    false == match.nil?
  end 
end
