# frozen_string_literal: true

require "components/test_helper"

class ButtonTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Button.new) { "Button" }

    assert_selector(".button", text: "Button")
  end

  def test_renders_with_size
    render_inline(Sailboat::Button.new(size: :small)) { "Button" }

    assert_selector(".button.button--small", text: "Button")
  end

  def test_renders_with_scheme
    render_inline(Sailboat::Button.new(scheme: :success)) { "Button" }

    assert_selector(".button.button--success", text: "Button")
  end

  def test_renders_with_custom_classes
    render_inline(Sailboat::Button.new(classes: "foo")) { "Button" }

    assert_selector(".button.foo", text: "Button")
  end

  def test_renders_with_custom_data
    render_inline(Sailboat::Button.new(data: { controller: "foo" })) { "Button" }

    assert_selector('.button[data-controller="foo"]', text: "Button")
  end
end
