# frozen_string_literal: true

module Sailboat
  class Card < Sailboat::Component
    renders_one :header, "Header"

    def initialize(**system_arguments)
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :div
      @system_arguments[:classes] = class_names(
        "card",
        @system_arguments[:classes],
      )
    end

    class Header < Sailboat::Component
      def initialize(**system_arguments)
        @tag = :h3
        @system_arguments = deny_tag_argument(**system_arguments)
        @system_arguments[:class] = class_names(
          "card__header",
          @system_arguments[:classes],
        )
      end

      def call
        content_tag(@tag, content, **@system_arguments)
      end
    end
  end
end
