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

  it "does type matter? Ought I be able to expect numbers for example. Currently all are strings."
  
  it "can supply mappings" do
    settings = Settings.new

    settings.configure do
      let "U" => :username
      let "P" => :password
    end

    ENV["U"] = "graeme.hay"
    ENV["P"] = "allblacks"
    
    expect(settings.username).to eql "graeme.hay"
    expect(settings.password).to eql "allblacks"
  end

  it "you can map some and not others" do
    settings_configured_with_username_mapping_only = Settings.new

    settings_configured_with_username_mapping_only.configure do
      let "U" => :username
    end

    ENV["U"] = "graeme.hay"
    ENV["P"] = "allblacks"
    
    expect(settings_configured_with_username_mapping_only.username).to eql "graeme.hay"
    expect(settings_configured_with_username_mapping_only.P).to eql "allblacks"
  end

  it "fails if you try and configure without a block" do
    expect{Settings.new.configure}.to raise_error /You have to supply a block/
  end

  it "You can have a setting called :new and/or :initialize" do
    settings = Settings.new
    
    ENV["new"] = "okay"
    ENV["initialize"] = "yes please"
    
    expect(settings.new).to eql "okay"
    expect(settings.initialize).to eql "yes please"
  end

  it "make sure you can use setting name 'configure'"

  # Can't use metaclass because class < Object which has lots of methods defined. BasicObject is what we want.
end

describe "Can use a file on disk"
describe "Can use a chain of sources, for example ENV falling back to file on disk"
