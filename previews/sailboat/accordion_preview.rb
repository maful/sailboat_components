# frozen_string_literal: true

module Sailboat
  # @label Accordion
  class AccordionPreview < ViewComponent::Preview
    # @label Playground
    def playground
      render(Sailboat::Accordion.new) do |c|
        c.with_summary do
          "Summary"
        end
        c.with_body do
          "Body"
        end
      end
    end

    # @label Without caret
    def without_caret
      render(Sailboat::Accordion.new) do |c|
        c.with_summary(caret: false) do
          "Summary"
        end
        c.with_body do
          "Body"
        end
      end
    end
  end
end
