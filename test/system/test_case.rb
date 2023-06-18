# frozen_string_literal: true

require "system/test_helper"
require "capybara/rails"
require "capybara/minitest"

require "test_helpers/cuprite_setup"
require "test_helpers/retry"

module System
  class TestCase < ActionDispatch::SystemTestCase
    driven_by :sailboat_cuprite,
      using: :chrome,
      screen_size: [1400, 1400],
      options: { process_timeout: 240, timeout: 240 }

    def visit_preview(scenario_name, params = {})
      component_name = self.class.name.gsub("Test", "").gsub("Integration", "")

      component_uri = component_name.underscore
      url = +"/rails/view_components/sailboat/#{component_uri}/#{scenario_name}"
      query_string = params.map { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }.join("&")
      url << "?#{query_string}" if query_string.present?

      visit(url)
    end
  end
end
