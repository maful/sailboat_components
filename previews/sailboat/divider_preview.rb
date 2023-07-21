# frozen_string_literal: true

module Sailboat
  # @label Divider
  class DividerPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param content_position select {{ Sailboat::Divider::CONTENT_POSITIONS.keys }}
    # @param content text
    #
    def playground(content_position: Sailboat::Divider::DEFAULT_CONTENT_POSITION, content: "More")
      render(Sailboat::Divider.new(content_position: content_position)) { content }
    end

    # @!group Text Position
    #
    # @label Default
    def default
      render(Sailboat::Divider.new(content_position: Sailboat::Divider::DEFAULT_CONTENT_POSITION))
    end

    # @label Text Center
    def text_center
      render(Sailboat::Divider.new(content_position: :center)) { "More" }
    end

    # @label Text Left
    def text_left
      render(Sailboat::Divider.new(content_position: :left)) { "More" }
    end

    # @label Text Right
    def text_right
      render(Sailboat::Divider.new(content_position: :right)) { "More" }
    end
    #
    # @!endgroup
  end
end
