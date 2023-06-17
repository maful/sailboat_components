# frozen_string_literal: true

module Sailboat
  module ComponentTestHelpers
    include ViewComponent::TestHelpers

    def with_raise_on_invalid_options(new_value)
      old_value = Rails.application.config.sailboat_components.raise_on_invalid_options
      Rails.application.config.sailboat_components.raise_on_invalid_options = new_value
      yield
    ensure
      Rails.application.config.sailboat_components.raise_on_invalid_options = old_value
    end

    def with_env(env)
      old_env = ENV.to_hash
      ENV.replace(old_env.merge(env))
      yield
    ensure
      ENV.replace(old_env)
    end

    def assert_selector(*args, message: nil, **kwargs, &block)
      super(*args, **kwargs, &block)
    rescue ::Minitest::Assertion => e
      raise unless message

      raise ::Minitest::Assertion, "#{message}: #{e.message}"
    end
  end
end
