require "selenium-webdriver"
require "rspec"
require "rubygems"
require "webdrivers"

$driver = Selenium::WebDriver.for :firefox
$driver.manage.window.maximize
$wait = Selenium::WebDriver::Wait.new(:timeout => 40)

at_exit do
  $driver.quit
end
