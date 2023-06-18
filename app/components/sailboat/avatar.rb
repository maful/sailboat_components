# frozen_string_literal: true

module Sailboat
  class Avatar < Sailboat::Component
    DEFAULT_SHAPE = :circle
    SHAPE_OPTIONS = [DEFAULT_SHAPE, :square].freeze

    DEFAULT_SIZE = 24
    SIZE_OPTIONS = [DEFAULT_SIZE, 32, 40, 48, 56, 64].freeze

    def initialize(src:, alt:, size: DEFAULT_SIZE, shape: DEFAULT_SHAPE, **system_arguments)
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :img
      @system_arguments[:src] = src
      @system_arguments[:alt] = alt
      @system_arguments[:size] = fetch_or_fallback(SIZE_OPTIONS, size, DEFAULT_SIZE)
      @system_arguments[:height] = @system_arguments[:size]
      @system_arguments[:width] = @system_arguments[:size]

      @system_arguments[:classes] = class_names(
        system_arguments[:classes],
        "avatar",
        "avatar--circle" => shape == DEFAULT_SHAPE,
      )
      @box_classes = class_names("avatar-#{fetch_or_fallback(SIZE_OPTIONS, size, DEFAULT_SIZE)}")
    end

    def call
      render(Sailboat::BaseComponent.new(**@system_arguments)) { content }
    end

    private

    def fetch_or_fallback(allowed_values, value, fallback = nil)
      if allowed_values.include?(value)
        value
      else
        fallback
      end
    end
  end
end
