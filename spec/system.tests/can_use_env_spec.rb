require "spec_helper"

describe "Can use environment variables as a settings list" do
  it "an example" do
    ENV["xxx"] = "bangerman"
    expect(Settings.xxx).to eql "bangerman"
  end

  it "another example" do
    ENV["timeout"] = "30"
    expect(Settings.timeout).to eql "30"
  end

  it "name may not be used?"
  it "does what when setting does not exist?"
  it "does type matter? Ought I be able to expect numbers for example. Currently all are strings."
end
