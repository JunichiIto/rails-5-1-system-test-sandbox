require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Chromedriver.set_version "2.31"
  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w(--headless --disable-gpu)})
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: { desired_capabilities: caps }
end
