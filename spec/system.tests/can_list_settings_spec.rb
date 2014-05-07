require 'spec_helper'

describe "Listing the current settings" do
  it "tells me about defaults" do
    settings = Settings.new do
      default :color, :to => 'pink'
      default :size, :to => 'L'
    end

    expect(settings.inspect).to match /<color> defaults to <pink>/
    expect(settings.inspect).to match /<size> defaults to <L>/
  end
end
