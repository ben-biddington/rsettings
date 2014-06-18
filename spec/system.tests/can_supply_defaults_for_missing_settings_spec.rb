require "spec_helper"

describe "default values for missing settings" do
  it "can be configured to use a default when setting is missing" do
    settings = Settings.new do
      default :colour, :to => "red"
    end

    expect(settings.colour).to eql "red"
  end

  it "can be overwritten -- the last set one wins" do
    settings = Settings.new do
      default :colour, :to => "red"
      default :colour, :to => "gold"
    end

    expect(settings.colour).to eql "gold"
  end

  it "you can default a mapped setting" do
    settings = Settings.new do
      let "C" => :colour
      default :colour, :to => "green"
    end

    expect(settings.colour).to eql "green"
  end

  it "is ignored if present elsewhere" do
    settings = Settings.new do
      default :colour, :to => "red"
    end

    ENV["colour"] = "pink"

    expect(settings.colour).to eql "pink"
  end

  it "can default a flag too" do
    settings = Settings.new do
      default :loud, :to => "on"
    end

    expect(settings.loud?).to be_true
  end
end
