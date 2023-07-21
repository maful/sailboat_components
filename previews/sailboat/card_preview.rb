# frozen_string_literal: true

module Sailboat
  # @label Card
  class CardPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param header text
    # @param content text
    def playground(header: "Header", content: "This is card")
      render(Sailboat::Card.new) do |c|
        c.with_header { header }

        content
      end
    end
  end
end
