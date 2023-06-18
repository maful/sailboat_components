# frozen_string_literal: true

module Sailboat
  # @label Button
  class ButtonPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param scheme [Symbol] select [default, primary, error, success]
    # @param size [Symbol] select [small, medium, large]
    # @param disabled toggle
    # @param content text
    def playground(scheme: Sailboat::Button::DEFAULT_SCHEME, size: Sailboat::Button::DEFAULT_SIZE, disabled: false,
      content: "Button")
      render(Sailboat::Button.new(scheme: scheme, size: size, disabled: disabled)) { content }
    end

    # @label Default
    #
    def default
      render(Sailboat::Button.new) { "Button" }
    end

    # @label All schemes
    def all_schemes
      render_with_template(locals: {})
    end

    # @label All sizes
    def all_sizes
      render_with_template(locals: {})
    end
  end
end
