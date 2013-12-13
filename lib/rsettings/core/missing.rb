module Missing
  def listen_to settings
    settings.on :missing do |e,args|
      self.on_missing args.first
    end
  end

  protected

  def on_missing(name); end
end

class IgnoreMissing
  include Missing
end

class FailOnMissing
  include Missing

  protected

  def on_missing(name)
    fail "Setting <#{name.value}> not found"
  end
end
