require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w(--headless)})
  driven_by :selenium, using: :chrome, options: { desired_capabilities: caps }
end
