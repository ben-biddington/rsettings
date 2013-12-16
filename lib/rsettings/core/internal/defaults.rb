class Defaults
  def initialize(names)
    @names = names
  end
  
  def get(setting)
    real_name = @names.reverse_for setting
    Setting.new defaults[real_name]
  end

  def add(name, value)
    defaults[name] = value
  end

  def any?; false == defaults.empty? end 

  private

  def defaults; @defaults ||= {}; end
end
