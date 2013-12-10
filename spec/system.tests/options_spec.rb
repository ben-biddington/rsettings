require "spec_helper"

describe "what to do when a setting is missing" do
  it "fails by default" do
    ENV.clear
    settings = Settings.new
    expect{settings.one_that_does_not_exist}.to raise_error /<one_that_does_not_exist> not found/
  end
end
