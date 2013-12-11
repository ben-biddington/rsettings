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
  
  it "can supply mappings" do
    settings = Settings.new do 
      let "U" => :username
      let "P" => :password
    end

    ENV["U"] = "graeme.hay"
    ENV["P"] = "allblacks"
    
    expect(settings.username).to eql "graeme.hay"
    expect(settings.password).to eql "allblacks"
  end

  it "you can map some and not others" do
    settings_configured_with_username_mapping_only = Settings.new do
      let "U" => :username
    end

    ENV["U"] = "graeme.hay"
    ENV["P"] = "allblacks"
    
    expect(settings_configured_with_username_mapping_only.username).to eql "graeme.hay"
    expect(settings_configured_with_username_mapping_only.P).to eql "allblacks"
  end

  it "you can map none" do
    settings_configured_with_nothing = Settings.new do
      
    end

    ENV["U"] = "graeme.hay"
    ENV["P"] = "allblacks"
    
    expect(settings_configured_with_nothing.U).to eql "graeme.hay"
    expect(settings_configured_with_nothing.P).to eql "allblacks"
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
