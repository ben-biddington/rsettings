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
end
