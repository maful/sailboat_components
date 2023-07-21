# frozen_string_literal: true

module Sailboat
  class Divider < Sailboat::Component
    DEFAULT_CONTENT_POSITION = :default
    CONTENT_POSITIONS = {
      DEFAULT_CONTENT_POSITION => "divider--default",
      :center => "divider--center",
      :left => "divider--left",
      :right => "divider--right",
    }.freeze

    def initialize(content_position: DEFAULT_CONTENT_POSITION, **system_arguments)
      @content_position = content_position
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = @content_position == DEFAULT_CONTENT_POSITION ? :hr : :div
      @system_arguments[:classes] = class_names(
        "divider",
        CONTENT_POSITIONS.fetch(@content_position, CONTENT_POSITIONS[DEFAULT_CONTENT_POSITION]),
        @system_arguments[:classes],
      )
    end
  end
end
