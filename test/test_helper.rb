# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "minitest/autorun"
require "rails"
require "rails/test_help"
require "view_component/test_helpers"
require "action_controller/railtie"
require "rails/test_unit/railtie"
require "active_model/railtie"

require File.expand_path("../demo/config/environment.rb", __dir__)
