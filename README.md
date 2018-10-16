[![Build Status](https://travis-ci.org/testingbot/ruby-rspec-example.svg?branch=master)](https://travis-ci.org/testingbot/ruby-rspec-example)

## TestingBot - RSpec Example

TestingBot provides an online grid of browsers and mobile devices to run Automated tests on via Selenium WebDriver.
This example demonstrates how to use Ruby with RSpec to run a test in parallel across several browsers.

### Environment Setup

1. Global Dependencies
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    * Or Install Ruby with [Homebrew](http://brew.sh/)
    ```
    $ brew install ruby
    ```
    * Install [Rake](http://docs.seattlerb.org/rake/)
    ```
    $ gem install rake
    ```
    * Install bundler (sudo may be necessary)
    ```
    $ gem install bundler
    ```

2. TestingBot Credentials
    * Add your TestingBot Key and Secret as environmental variables. You can find these in the [TestingBot Dashboard](https://testingbot.com/members/).
    ```
    $ export TB_KEY=<your TestingBot Key>
    $ export TB_SECRET=<your TestingBot Secret>
    ```

3. Project Dependencies
    * Install packages (Use sudo if required)
    ```
    $ bundle install
    ```

### Running Tests

* Tests in Parallel:
    ```
    $ rake test_testingbot
    ```
You will see the test result in the [TestingBot Dashboard](https://testingbot.com/members/)

### Resources
##### [TestingBot Documentation](https://testingbot.com/support/)

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)

##### [Cucumber Documentation](https://cucumber.io/docs/reference)

##### [Capybara Documentation](http://www.rubydoc.info/github/jnicklas/capybara/master)

##### [Ruby Documentation](http://ruby-doc.org/)
