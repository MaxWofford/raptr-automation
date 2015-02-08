require 'selenium-webdriver'
require_relative 'config'

def is_flag_on?(flag)
  ARGV.include?(flag)
end

def sign_in(driver)
  puts 'signing in'
  driver.find_element(:id, 'popup-email').send_keys(R_USERNAME)
  driver.find_element(:id, 'popup-pwd').send_keys(R_PASSWORD)
  driver.find_element(:id, 'popup-pwd').submit
  puts 'signed in'
end

if is_flag_on?("--firefox")
  driver = Selenium::WebDriver.for :firefox
else
  driver = Selenium::WebDriver.for :phantomjs
  driver.manage.window.resize_to(1000, 1000)
end

driver.navigate.to 'http://raptr.com/login'
sign_in(driver)
driver.navigate.to 'http://raptr.com/community'
puts driver.title
driver.quit
