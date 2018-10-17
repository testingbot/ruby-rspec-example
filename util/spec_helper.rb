require "rspec/expectations"
require "selenium-webdriver"
require "rspec"
require "testingbot"

RSpec.configure do | config |
  config.before(:each) do | test |
    capabilities_config = {
      :version => "#{ENV['version']}",
      :browserName => "#{ENV['browserName']}",
      :platform => "#{ENV['platform']}",
      :name => test.full_description
    }
    #If there's a build tag set it.
    if ENV['BUILD_TAG'] != nil
      capabilities_config['build'] = ENV['BUILD_TAG']
    end
    if ENV['TUNNEL_IDENTIFIER'] != nil
      capabilities_config['tunnel-identifier'] = ENV['TUNNEL_IDENTIFIER']
    end
    url = "https://#{ENV['TB_KEY']}:#{ENV['TB_SECRET']}@hub.testingbot.com/wd/hub".strip
    @driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities_config)
  end

  config.after(:each) do | test |
    sessionid = @driver.session_id
    puts("TestingBotSessionId=#{sessionid} job-name=#{test.full_description}")
    @driver.quit

    api = TestingBot::Api.new(ENV['TB_KEY'], ENV['TB_SECRET'])
    if test.exception
      api.update_test(sessionid, { :success => false })
    else
      api.update_test(sessionid, { :success => true })
    end
  end
end
