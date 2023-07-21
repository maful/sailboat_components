# frozen_string_literal: true

module Sailboat
  # @label Breadcrumbs
  class BreadcrumbsPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param number_of_links [Integer] number
    # @param background toggle
    def playground(number_of_links: 2, background: false)
      render(Sailboat::Breadcrumbs.new(background: background)) do |c|
        Array.new(number_of_links || 2) do |i|
          c.with_item(href: "##{i}") { "Breadcrumb Item #{i + 1}" }
        end
      end
    end
  end
end
