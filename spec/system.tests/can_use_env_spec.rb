require "spec_helper"

describe "Can use environment variables as a settings list" do
  it "an example" do
    ENV["xxx"] = "bangerman"
    expect(Settings.new.xxx).to eql "bangerman"
  end

  it "name may be used (name is interesting because it is implemented on Object)" do
    ENV["name"] = "bangerman"
    expect(Settings.new.name).to eql "bangerman"
  end

  it "fails when setting does not exist" do
    ENV.clear
    expect{Settings.new.name}.to raise_error /Setting <name> not found/
  end

  it "does type matter? Ought I be able to expect numbers for example. Currently all are strings."

  # Can't use metaclass because class < Object which has lots of methods defined. BasicObject is what we want.
end

describe "Can use a file on disk"
describe "Can use a chain of sources, for example ENV falling back to file on disk"
