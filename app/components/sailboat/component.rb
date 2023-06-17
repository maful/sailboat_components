# frozen_string_literal: true

require "view_component/version"

module Sailboat
  # @private
  class Component < ViewComponent::Base
    private

    def deny_single_argument(key, help_text, **arguments)
      raise ArgumentError, "`#{key}` is an invalid argument. #{help_text}" \
        if should_raise_error? && arguments.key?(key)

      arguments.except!(key)
    end

    def deny_tag_argument(**arguments)
      deny_single_argument(:tag, "This component has a fixed tag.", **arguments)
    end

    def should_raise_error?
      !Rails.env.production? && !ENV["SAILBOAT_WARNINGS_DISABLED"]
    end
  end
end
