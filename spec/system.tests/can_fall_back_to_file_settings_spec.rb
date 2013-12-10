require "spec_helper"

describe "a settings fallback" do
  it "for example, you can fall back to a setting on disk" do
    settings = Settings.new do
      with_settings :chain => [EnvironmentSettings, BasicDiskSettings]
    end

    ENV.clear

    BasicDiskSettings.new do
      clear
      set :jazzs_bike_shorts => "tight"
    end

    expect(settings.jazzs_bike_shorts).to eql "tight"
  end

  it "by default you get environment settings only"
end
