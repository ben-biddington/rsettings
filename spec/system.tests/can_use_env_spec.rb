require "spec_helper"

describe "Can use environment variables as a settings list" do
  it "an example" do
    ENV["name"] = "bangerman"
    expect(Settings.name).to eql "bangerman"
  end

  it "does what when setting does not exist?"
end
