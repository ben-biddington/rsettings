require "spec_helper"

describe "a settings fallback" do
  before do
    ENV.clear

    BasicDiskSettings.new do
      clear
      set :jazzs_bike_shorts => "tight"
    end
  end

  let(:settings) do 
    Settings.new do
      with_settings :chain => [EnvironmentSettings, BasicDiskSettings]
    end
  end

  it "for example, you can fall back to a setting on disk" do
    expect(settings.jazzs_bike_shorts).to eql "tight"
  end

  it "you get the environment setting when it exists" do
    ENV["jazzs_bike_shorts"] = "this is from the environment variables"

    expect(settings.jazzs_bike_shorts).to eql "this is from the environment variables"
  end
end
