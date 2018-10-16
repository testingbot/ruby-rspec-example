def run_tests(platform, browser, version, junit_dir)
  system("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" JUNIT_DIR=\"#{junit_dir}\" parallel_split_test spec")
end

task :default => [:test_testingbot]

task :windows_10_ie_11 do
  run_tests('Windows 10', 'internet explorer', '11', 'junit_reports/windows_10_ie_11')
end

task :windows_7_firefox_latest do
  run_tests('Windows 7', 'firefox','latest', 'junit_reports/windows_7_firefox_latest')
end

task :os_x_10_14_chrome_latest do
  run_tests('OS X 10.14', 'chrome', 'latest', 'junit_reports/os_x_10_14_chrome_latest')
end

multitask :test_testingbot => [
    :windows_10_ie_11,
    :windows_7_firefox_latest,
    :os_x_10_14_chrome_latest,
  ] do
    puts 'Running automation'
  end
