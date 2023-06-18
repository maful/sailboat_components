# frozen_string_literal: true

module Sailboat
  # @label Badge
  class BadgePreview < ViewComponent::Preview
    # @label Playground
    #
    # @param dismissible toggle
    # @param scheme [Symbol] select [default, primary, error, warning, success]
    # @param size [Symbol] select [medium, large]
    # @param content text
    def playground(dismissible: false, scheme: Sailboat::Badge::DEFAULT_SCHEME, size: Sailboat::Badge::DEFAULT_SIZE,
      content: "Badge")
      render(Sailboat::Badge.new(dismissible: dismissible, scheme: scheme, size: size)) { content }
    end

    # @label Default
    #
    def default
      render(Sailboat::Badge.new) { "Badge" }
    end

    # @label Dismissible
    #
    def dismissible
      render(Sailboat::Badge.new(dismissible: true)) { "Badge" }
    end

    # @!group Color Schemes
    #
    # @label Default
    def color_scheme_default
      render(Sailboat::Badge.new) { "Badge" }
    end

    # @label Primary
    def color_scheme_primary
      render(Sailboat::Badge.new(scheme: :primary)) { "Badge" }
    end

    # @label Error
    def color_scheme_error
      render(Sailboat::Badge.new(scheme: :error)) { "Badge" }
    end

    # @label Warning
    def color_scheme_warning
      render(Sailboat::Badge.new(scheme: :warning)) { "Badge" }
    end

    # @label Success
    def color_scheme_success
      render(Sailboat::Badge.new(scheme: :success)) { "Badge" }
    end
    #
    # @!endgroup
  end
end
