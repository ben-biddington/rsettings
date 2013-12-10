require "spec_helper"

describe "what to do when a setting is missing" do
  before { ENV.clear }

  it "fails by default" do
    settings = Settings.new
    expect{settings.one_that_does_not_exist}.to raise_error /<one_that_does_not_exist> not found/
  end

  it "you can instruct it to do nothing" do
    settings = Settings.new do
      when_missing :ignore
    end

    expect(settings.one_that_does_not_exist).to be_nil
  end
end
