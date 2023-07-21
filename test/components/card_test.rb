# frozen_string_literal: true

require "components/test_helper"

class CardTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Card.new) { "card" }

    assert_selector(".card .card__content", text: "card")
    refute_selector(".card .card__header")
  end

  def test_renders_with_header
    render_inline(Sailboat::Card.new) do |c|
      c.with_header { "header" }

      "card"
    end

    assert_selector(".card .card__header", text: "header")
    assert_selector(".card .card__content", text: "card")
  end

  def test_renders_custom_classes
    render_inline(Sailboat::Card.new(classes: "mb-4")) do |c|
      c.with_header { "header" }

      "card"
    end

    assert_selector(".card.mb-4")
  end

  def test_renders_header_custom_classes
    render_inline(Sailboat::Card.new) do |c|
      c.with_header(classes: "mb-4") { "header" }

      "card"
    end

    assert_selector(".card .card__header.mb-4", text: "header")
  end
end
