# frozen_string_literal: true

module SailboatComponents
  class Engine < ::Rails::Engine
    isolate_namespace SailboatComponents

    config.sailboat_components = ActiveSupport::OrderedOptions.new
    config.sailboat_components.raise_on_invalid_options = false
    config.sailboat_components.silence_deprecations = false
  end
end
