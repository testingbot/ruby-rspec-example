BROWSERS = {
  windows_11_chrome_latest: { name: 'chrome', version: 'latest', platform: 'WIN11' },
  windows_11_firefox_latest: { name: 'firefox', version: 'latest', platform: 'WIN11' },
  macos_sequoia_safari_latest: { name: 'safari', version: 'latest', platform: 'SEQUOIA' }
}.freeze

def run_tests(browser)
  env = {
    'BROWSER_NAME' => browser[:name],
    'BROWSER_VERSION' => browser[:version],
    'PLATFORM_NAME' => browser[:platform]
  }
  system(env, 'bundle exec rspec spec') || raise("Tests failed on #{browser[:name]} #{browser[:platform]}")
end

BROWSERS.each do |task_name, browser|
  desc "Run the specs on #{browser[:name]} #{browser[:version]} (#{browser[:platform]})"
  task(task_name) { run_tests(browser) }
end

task default: [:test_testingbot]

desc 'Run the specs on all browsers in parallel'
multitask test_testingbot: BROWSERS.keys do
  puts 'All browsers finished'
end
