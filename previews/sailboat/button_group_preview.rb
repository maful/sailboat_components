# frozen_string_literal: true

module Sailboat
  # @label ButtonGroup
  class ButtonGroupPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param size [Symbol] select [small, medium, large]
    def playground(size: :medium)
      render(Sailboat::ButtonGroup.new(size: size)) do |c|
        c.with_button { "Button 1" }
        c.with_button { "Button 2" }
        c.with_button { "Button 3" }
      end
    end
  end
end
