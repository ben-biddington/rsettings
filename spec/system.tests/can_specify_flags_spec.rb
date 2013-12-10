require "spec_helper"

describe "settings that are either true or false" do
  let(:settings){Settings.new}

  before { ENV.clear }

  it "returns a flag when value is 'yes' or 'no'" do
    ENV["allowed"] = "yes"
    ENV["disallowed"] = "no"

    expect(settings.allowed?).to be_true
    expect(settings.disallowed?).to be_false
  end

  it "any other value returns setting not found" do
    ENV["allowed"] = "xxx"

    expect{settings.allowed?}.to raise_error /Unable to convert setting <allowed> to flag/
  end

  it "accepts mapped setting names, too" do
    settings = Settings.new do
      let "V" => "verbose"
    end

    ENV["V"] = "yes"

    expect(settings.verbose?).to be_true
  end
end
