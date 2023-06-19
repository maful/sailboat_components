# frozen_string_literal: true

module Sailboat
  class Accordion < Sailboat::Component
    renders_one :summary, "Summary"

    # Use the Body slot as the main content to be shown when triggered by the Summary.
    renders_one :body, lambda { |**system_arguments|
      system_arguments[:tag] = :div

      Sailboat::BaseComponent.new(**system_arguments)
    }

    def initialize(**system_arguments)
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :details
      @system_arguments[:classes] = class_names(
        "accordion",
        @system_arguments[:classes],
      )
    end

    def render?
      summary.present? && body.present?
    end

    class Summary < Sailboat::Component
      def initialize(caret: true, **system_arguments)
        @caret = caret
        @system_arguments = deny_tag_argument(**system_arguments)
        @system_arguments[:tag] = :summary
        @system_arguments[:classes] = class_names(
          "accordion__summary",
          @system_arguments[:classes],
        )
      end
    end
  end
end
