require "spec_helper"

describe "a settings fallback" do
  before do
    ENV.clear

    @disk_settings = BasicDiskSettings.new do
      clear
      set :jazzs_bike_shorts => "tight"
    end
  end

  let (:settings) do 
    Settings.new do
      with_settings :chain => [EnvironmentSettings, BasicDiskSettings]
    end
  end

  let (:disk_settings) do
    @disk_settings
  end

  it "for example, you can fall back to a setting on disk" do
    expect(settings.jazzs_bike_shorts).to eql "tight"
  end

  it "you get the environment setting when it exists" do
    ENV["jazzs_bike_shorts"] = "this is from the environment variables"

    expect(settings.jazzs_bike_shorts).to eql "this is from the environment variables"
  end

  it "you can fallback one and not another" do
    ENV["b"] = "env b"

    disk_settings.clear
    disk_settings.set :a => "disk a", :b => "disk b"

    expect(settings.a).to eql "disk a"
    expect(settings.b).to eql "env b"
  end

  it "you can use ONLY disk if you like" do
    settings = Settings.new do
      with_settings BasicDiskSettings
    end

    ENV["ben_rules"] = "expect this to be ignored"

    disk_settings.clear
    disk_settings.set :ben_rules => "yes"

    expect(settings.ben_rules).to eql "yes"
  end
end
