require "rspec"
require "selenium-webdriver"

# Browser options for the remote session. The Rakefile sets BROWSER_NAME,
# BROWSER_VERSION and PLATFORM_NAME for each browser it runs.
def browser_options(test)
  browser = ENV.fetch("BROWSER_NAME", "chrome")
  options = case browser.downcase
            when "firefox" then Selenium::WebDriver::Options.firefox
            when "safari" then Selenium::WebDriver::Options.safari
            when "microsoftedge", "edge" then Selenium::WebDriver::Options.edge
            else Selenium::WebDriver::Options.chrome
            end
  options.browser_version = ENV.fetch("BROWSER_VERSION", "latest")
  options.platform_name = ENV.fetch("PLATFORM_NAME", "WIN11")

  tb_options = {
    "key" => ENV["TESTINGBOT_KEY"] || ENV["TB_KEY"],
    "secret" => ENV["TESTINGBOT_SECRET"] || ENV["TB_SECRET"],
    "name" => test.full_description
  }
  tb_options["build"] = ENV["BUILD_TAG"] if ENV["BUILD_TAG"]
  tb_options["tunnel-identifier"] = ENV["TUNNEL_IDENTIFIER"] if ENV["TUNNEL_IDENTIFIER"]
  options.add_option("tb:options", tb_options)
  options
end

RSpec.configure do |config|
  config.before(:each) do |test|
    @driver = Selenium::WebDriver.for(:remote,
                                      url: "https://hub.testingbot.com/wd/hub",
                                      options: browser_options(test))
  end

  config.after(:each) do |test|
    next unless @driver

    begin
      puts("TestingBotSessionId=#{@driver.session_id} job-name=#{test.full_description}")
      @driver.execute_script("tb:test-result=#{test.exception ? 'failed' : 'passed'}")
    ensure
      @driver.quit
    end
  end
end
