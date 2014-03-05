# -- coding: utf-8

require "timeout"

class Masque
  module DSL
    def save_screenshot(path)
      page.driver.save_screenshot(path)
    end
    alias :render :save_screenshot

    def page
      session
    end

    def driver
      session.driver
    end

    def driver_name
      p driver.methods.sort
      case driver.class.to_s
      when 'Capybara::Driver::Webkit', 'Capybara::Webkit::Driver'
        :webkit
      when 'Capybara::Poltergeist::Driver'
        :poltergeist
      else
        :unknown
      end
    end

    def set_headers(headers = {})
      case driver_name
      when :webkit
        headers.each_pair {|k,v| driver.header(k, v)}
      when :poltergeist
        driver.headers = headers
      else
        raise "for unknown driver"
      end
    end
    alias :set_request_headers :set_headers

    def cookies
      driver.cookies # driver specific format
    end

    def resize(x, y)
      case driver_name
      when :webkit
        driver.resize_window(x, y)
      when :poltergeist
        driver.resize(x, y)
      else
        raise "for unknown driver"
      end
    end
    alias :resize_window :resize

    def wait_until(timeout = nil, &block)
      timeout ||= 5
      start = Time.now
      ret = nil
      loop do
        break if ret = yield
        sleep 0.01
        raise TimeoutError if (Time.now - start) > timeout
      end
      ret
    end

  end
end
