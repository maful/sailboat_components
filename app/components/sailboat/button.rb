# frozen_string_literal: true

module Sailboat
  class Button < Sailboat::Component
    DEFAULT_SCHEME = :default
    SCHEME_MAPPINGS = {
      DEFAULT_SCHEME => "button--gray",
      :primary => "button--primary",
      :success => "button--success",
      :error => "button--error",
    }.freeze

    DEFAULT_SIZE = :medium
    SIZE_MAPPINGS = {
      DEFAULT_SIZE => "button--medium",
      :small => "button--small",
      :large => "button--large",
    }.freeze

    def initialize(scheme: DEFAULT_SCHEME, size: DEFAULT_SIZE, **system_arguments)
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :button
      @system_arguments[:classes] = class_names(
        @system_arguments[:classes],
        "button",
        SCHEME_MAPPINGS.fetch(scheme, SCHEME_MAPPINGS[DEFAULT_SCHEME]),
        SIZE_MAPPINGS.fetch(size, SIZE_MAPPINGS[DEFAULT_SIZE]),
      )
    end
  end
end
