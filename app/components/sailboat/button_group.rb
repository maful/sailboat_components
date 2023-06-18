# frozen_string_literal: true

module Sailboat
  class ButtonGroup < Sailboat::Component
    # Required list of buttons to be rendered.
    renders_many :buttons, lambda { |**kwargs|
                             kwargs[:size] = @size

                             Sailboat::Button.new(**kwargs)
                           }

    def initialize(size: Sailboat::Button::DEFAULT_SIZE, **system_arguments)
      @size = size
      @system_arguments = deny_tag_argument(**system_arguments)
      @system_arguments[:tag] = :div
      @system_arguments[:classes] = class_names(
        "button-group",
        @system_arguments[:classes],
      )
    end

    def render?
      buttons.any?
    end
  end
end
