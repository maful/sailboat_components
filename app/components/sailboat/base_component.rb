# frozen_string_literal: true

module Sailboat
  class BaseComponent < Sailboat::Component
    def initialize(tag:, classes: nil, **system_arguments)
      @tag = tag
      @classes = { class: classes }
      @system_arguments = system_arguments
    end

    def call
      content_tag(@tag, content, **@system_arguments.merge(@classes))
    end
  end
end
