## TestingBot - RSpec Example

TestingBot provides an online grid of browsers and mobile devices to run Automated tests on via Selenium WebDriver.
This example demonstrates how to use Ruby with RSpec and Selenium 4 to run a test in parallel across several browsers.

### Environment Setup

1. Global Dependencies
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) 3.0 or newer
    * Install bundler (sudo may be necessary)
    ```
    $ gem install bundler
    ```

2. TestingBot Credentials
    * Add your TestingBot Key and Secret as environment variables. You can find these in the [TestingBot Dashboard](https://testingbot.com/members/).
    ```
    $ export TESTINGBOT_KEY=<your TestingBot Key>
    $ export TESTINGBOT_SECRET=<your TestingBot Secret>
    ```
    (`TB_KEY`/`TB_SECRET` work too.)

3. Project Dependencies
    * Install packages
    ```
    $ bundle install
    ```

### Running Tests

* Tests in Parallel (Chrome and Firefox on Windows 11, Safari on macOS Sequoia):
    ```
    $ bundle exec rake test_testingbot
    ```
* One browser:
    ```
    $ bundle exec rake windows_11_chrome_latest
    ```
    Run `bundle exec rake -T` to list the browser tasks. Edit `BROWSERS` in the `Rakefile` to change them.

Each test is marked as passed or failed on TestingBot. You will see the test results in the [TestingBot Dashboard](https://testingbot.com/members/).

### Resources
##### [TestingBot RSpec Documentation](https://testingbot.com/support/web-automate/selenium/ruby/rspec)

##### [Selenium Documentation](https://www.selenium.dev/documentation/)

##### [RSpec Documentation](https://rspec.info/documentation/)
