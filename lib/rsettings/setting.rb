class Setting
  def truthy?; @truthy; end
  
  def initialize(text)
    @text = text.to_s
    @truthy = text.downcase.match /(yes|no)/
  end

  def to_s; @text; end
end
