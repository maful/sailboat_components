# frozen_string_literal: true

module Sailboat
  # @label Alert
  class AlertPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param dismissible toggle
    # @param scheme [Symbol] select [default, error, warning, success]
    # @param content text
    def playground(dismissible: false, scheme: Sailboat::Alert::DEFAULT_SCHEME, content: "This is an alert!")
      render(Sailboat::Alert.new(dismissible: dismissible, scheme: scheme)) { content }
    end

    # @label Default
    #
    def default
      render(Sailboat::Alert.new) { "This is an alert!" }
    end

    # @!group Color Schemes
    #
    # @label Default
    def color_scheme_default
      render(Sailboat::Alert.new) { "This is an alert!" }
    end

    # @label Error
    def color_scheme_error
      render(Sailboat::Alert.new(scheme: :error)) { "This is an error alert!" }
    end

    # @label Warning
    def color_scheme_warning
      render(Sailboat::Alert.new(scheme: :warning)) { "This is a warning alert!" }
    end

    # @label Success
    def color_scheme_success
      render(Sailboat::Alert.new(scheme: :success)) { "This is a success alert!" }
    end
    #
    # @!endgroup

    # @!group More options
    #
    # @label Dismissible
    def options_dismissible
      render(Sailboat::Alert.new(dismissible: true)) { "This is a dismissible alert!" }
    end

    # @label Action
    def options_action
      render(Sailboat::Alert.new) do |c|
        c.with_action do
          tag.button("View Details")
        end

        "This is alert action"
      end
    end
    #
    # @!endgroup
  end
end
