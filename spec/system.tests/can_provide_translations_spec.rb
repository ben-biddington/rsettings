require "spec_helper"

describe "that you can translate storage names into whatever setting name you want" do
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

  it "when the setting is not found it tells you the mapped name, not the storage name" do
    settings = Settings.new do 
      let "U" => :username
    end

    ENV.clear

    pending "Needs to translate the setting name when telling you it's missing" do
      expect{settings.username}.to raise_error /Setting <username> not found/
    end
  end
end
