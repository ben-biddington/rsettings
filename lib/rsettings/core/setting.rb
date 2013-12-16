class Setting
  def truthy?; @truthy; end
  
  def initialize(text="")
    @text = text
    @truthy = (text||"").downcase.match /(yes|no)/
  end

  def missing?; @text.nil?; end

  def to_s; @text.to_s; end
end
