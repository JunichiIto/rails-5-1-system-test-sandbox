begin
  require 'action_dispatch/system_testing/driver'

  module ActionDispatch
    module SystemTesting
      class Driver
        private

        # Monkey patch for ChromeDriver 2.29
        def register
          Capybara.register_driver @name do |app|
            Capybara::Selenium::Driver.new(app, { browser: @browser }.merge(@options)).tap do |driver|
              # driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(*@screen_size)
            end
          end
        end
      end
    end
  end
rescue LoadError
  # ignore
end