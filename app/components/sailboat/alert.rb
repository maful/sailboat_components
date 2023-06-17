# frozen_string_literal: true

module Sailboat
  class Alert < Sailboat::Component
    DEFAULT_SCHEME = :default
    SCHEME_MAPPINGS = {
      DEFAULT_SCHEME => "alert--info",
      :warning => "alert--warning",
      :error => "alert--error",
      :success => "alert--success",
    }.freeze

    # Optional action content showed on the right side of the component.
    renders_one :action, lambda { |**system_arguments|
      deny_tag_argument(**system_arguments)
      system_arguments[:tag] = :div
      system_arguments[:classes] = class_names(system_arguments[:classes], "alert__action")

      Sailboat::BaseComponent.new(**system_arguments)
    }

    def initialize(dismissible: false, scheme: DEFAULT_SCHEME, **system_arguments)
      @dismissible = dismissible
      @scheme = scheme
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :div
      @system_arguments[:classes] = class_names(
        "alert",
        SCHEME_MAPPINGS.fetch(scheme, SCHEME_MAPPINGS[DEFAULT_SCHEME]),
      )
      if @dismissible
        @system_arguments[:"x-data"] = "SailboatDismissible"
        @system_arguments[:"x-show"] = "show"
        @system_arguments[:"x-cloak"] = ""
      end
    end
  end
end
