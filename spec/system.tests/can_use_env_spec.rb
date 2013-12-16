require "spec_helper"

describe "Can use environment variables as a settings list" do
  it "an example" do
    ENV["xxx"] = "bangerman"
    expect(Settings.new.xxx).to eql "bangerman"
  end

  it "name may be used (name is interesting because it is implemented on Object)" do
    ENV["name"] = "bangerman"
    expect(Settings.new.name).to eql "bangerman"
  end

  it "fails when setting does not exist" do
    ENV.clear
    expect{Settings.new.name}.to raise_error /Setting <name> not found/
  end

  it "You can have a setting called :new and/or :initialize" do
    settings = Settings.new
    
    ENV["new"] = "okay"
    ENV["initialize"] = "yes please"
    
    expect(settings.new).to eql "okay"
    expect(settings.initialize).to eql "yes please"
  end

  it "make sure you can use setting name 'configure'" do
    settings = Settings.new
    
    ENV["configure"] = "xxx_conf_xxx"
    
    expect(settings.configure).to eql "xxx_conf_xxx"
  end
  # Can't use metaclass because class < Object which has lots of methods defined. BasicObject is what we want.
end
