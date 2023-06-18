# frozen_string_literal: true

module Sailboat
  class Badge < Sailboat::Component
    DEFAULT_SCHEME = :default
    SCHEME_MAPPINGS = {
      DEFAULT_SCHEME => "badge--gray",
      :primary => "badge--primary",
      :warning => "badge--warning",
      :error => "badge--error",
      :success => "badge--success",
    }.freeze

    DEFAULT_SIZE = :medium
    SIZE_MAPPINGS = {
      DEFAULT_SIZE => "badge--medium",
      :large => "badge--large",
    }.freeze

    def initialize(scheme: DEFAULT_SCHEME, size: DEFAULT_SIZE, dismissible: false, **system_arguments)
      @dismissible = dismissible
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :span
      @system_arguments[:classes] = class_names(
        @system_arguments[:classes],
        "badge",
        SCHEME_MAPPINGS.fetch(scheme, SCHEME_MAPPINGS[DEFAULT_SCHEME]),
        SIZE_MAPPINGS.fetch(size, SIZE_MAPPINGS[DEFAULT_SIZE]),
        "badge--dismissible": @dismissible,
      )
      if @dismissible
        @system_arguments[:"x-data"] = "SailboatDismissible"
        @system_arguments[:"x-show"] = "show"
        @system_arguments[:"x-cloak"] = ""
      end
    end
  end
end
