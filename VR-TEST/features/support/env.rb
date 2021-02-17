require "capybara"
require "capybara/cucumber"
require "rspec"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
end

