# frozen_string_literal: true

module Sailboat
  class BaseComponent < Sailboat::Component
    # rubocop:disable Layout/LineLength
    SELF_CLOSING_TAGS = [:area, :base, :br, :col, :embed, :hr, :img, :input, :link, :meta, :param, :source, :track, :wbr].freeze
    # rubocop:enable Layout/LineLength

    def initialize(tag:, classes: nil, **system_arguments)
      @tag = tag
      @classes = { class: classes }
      @system_arguments = system_arguments
      @system_arguments[:"data-sailboat-component"] = true
    end

    def call
      if SELF_CLOSING_TAGS.include?(@tag)
        tag(@tag, **@system_arguments.merge(@classes))
      else
        content_tag(@tag, content, **@system_arguments.merge(@classes))
      end
    end
  end
end
