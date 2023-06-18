# frozen_string_literal: true

require "components/test_helper"

class BadgeTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Badge.new) { "badge" }

    assert_selector(".badge", text: "badge")
  end

  def test_renders_with_scheme
    render_inline(Sailboat::Badge.new(scheme: :primary)) { "badge" }

    assert_selector(".badge.badge--primary", text: "badge")
  end

  def test_renders_with_size
    render_inline(Sailboat::Badge.new(size: :large)) { "badge" }

    assert_selector(".badge.badge--large", text: "badge")
  end

  def test_renders_with_dismiss
    render_inline(Sailboat::Badge.new(dismissible: true)) { "badge" }

    assert_selector(".badge.badge--dismissible", text: "badge")
    assert_selector('.badge[x-data="SailboatDismissible"][x-cloak][x-show="show"]')
    assert_selector('.badge button[aria-label="Close"]')
  end

  def test_renders_with_custom_classes
    render_inline(Sailboat::Badge.new(classes: "foo")) { "badge" }

    assert_selector(".badge.foo", text: "badge")
  end
end
