require "spec_helper"

describe "Can use environment variables as a settings list" do
  it "an example" do
    ENV["xxx"] = "bangerman"
    expect(Settings.new.xxx).to eql "bangerman"
  end

  it "another example" do
    ENV["timeout"] = "30"
    expect(Settings.new.timeout).to eql "30"
  end

  it "name may be used" do
    ENV["name"] = "bangerman"
    expect(Settings.new.name).to eql "bangerman"
  end

  it "does what when setting does not exist?"
  it "does type matter? Ought I be able to expect numbers for example. Currently all are strings."
end
