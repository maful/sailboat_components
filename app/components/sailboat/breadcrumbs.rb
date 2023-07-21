# frozen_string_literal: true

module Sailboat
  class Breadcrumbs < Sailboat::Component
    ARIA_LABEL = { label: "breadcrumb" }.freeze

    # @param href [String] The URL to link to.
    # @param system_arguments [Hash]
    renders_many :items, "Item"

    def initialize(background: false, **system_arguments)
      @background = background
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :nav
      @system_arguments[:aria] = ARIA_LABEL
      @system_arguments[:classes] = class_names(
        "breadcrumb",
        @system_arguments[:classes],
      )
    end

    def render?
      items.any?
    end

    class Item < Sailboat::Component
      attr_accessor :selected, :href

      def initialize(href:, **system_arguments)
        @href = href
        @system_arguments = deny_tag_argument(**system_arguments)
        @system_arguments[:tag] = :li
        @selected = false
        @system_arguments[:classes] = class_names(
          "breadcrumb__item",
          @system_arguments[:classes],
        )
      end

      def call
        link_arguments = { href: href }

        if selected
          link_arguments[:"aria-current"] = "page"
          @system_arguments[:classes] = "#{@system_arguments[:classes]} breadcrumb__item--selected"
        end

        render(Sailboat::BaseComponent.new(**@system_arguments)) do
          tag.a(content, **link_arguments)
        end
      end
    end
  end
end
