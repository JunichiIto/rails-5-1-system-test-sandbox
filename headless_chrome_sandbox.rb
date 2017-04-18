# Modified from http://shoprev.hatenablog.com/entry/2014/04/14/210529
require 'selenium-webdriver'

caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w(--headless)})
driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit
