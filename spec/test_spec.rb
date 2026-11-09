require_relative "../util/spec_helper"

describe "TestingBot homepage" do
  it "has the expected title" do
    @driver.navigate.to "https://testingbot.com"
    expect(@driver.title).to include("TestingBot")
  end
end
