# frozen_string_literal: true

require "components/test_helper"

class ButtonGroupTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_does_not_render_without_buttons
    render_inline(Sailboat::ButtonGroup.new)

    refute_selector("div.button-group")
  end

  def test_renders_button_items
    render_inline(Sailboat::ButtonGroup.new(size: Sailboat::Button::DEFAULT_SIZE)) { |c| c.with_button { "Button" } }

    assert_selector("div.button-group") do
      assert_selector("button.button.button--medium", text: "Button")
    end
  end

  def test_renders_button_with_props
    render_inline(Sailboat::ButtonGroup.new) do |c|
      c.with_button { "Button" }
      c.with_button(classes: "custom-class") { "Custom class" }
    end

    assert_selector("div.button-group") do
      assert_selector("button.button", text: "Button")
      assert_selector("button.custom-class", text: "Custom class")
    end
  end

  def test_does_not_render_content
    render_inline(Sailboat::ButtonGroup.new) { "content" }

    refute_text("content")
  end

  def test_all_buttons_with_same_size
    render_inline(Sailboat::ButtonGroup.new(size: :small)) do |c|
      c.with_button(size: :medium) { "Medium" }
      c.with_button(size: :large) { "Large" }
    end

    assert_selector("div.button-group") do
      assert_selector("button.button.button--small", text: "Medium")
      assert_selector("button.button.button--small", text: "Large")
    end
  end
end
