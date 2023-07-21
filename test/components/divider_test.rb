# frozen_string_literal: true

require "components/test_helper"

class DividerTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders_default
    render_inline(Sailboat::Divider.new)

    assert_selector("hr.divider.divider--default")
  end

  def test_content_should_not_render_if_default
    render_inline(Sailboat::Divider.new) { "More" }

    refute_selector("hr.divider.divider--default", text: "More")
  end

  def test_text_position_center
    render_inline(Sailboat::Divider.new(content_position: :center)) { "More" }

    assert_selector("div.divider.divider--center", text: "More")
  end

  def test_text_position_left
    render_inline(Sailboat::Divider.new(content_position: :left)) { "More" }

    assert_selector("div.divider.divider--left", text: "More")
  end

  def test_text_position_right
    render_inline(Sailboat::Divider.new(content_position: :right)) { "More" }

    assert_selector("div.divider.divider--right", text: "More")
  end

  def test_with_custom_classes
    render_inline(Sailboat::Divider.new(content_position: :right, classes: "max-w-md")) { "More" }

    assert_selector("div.divider.divider--right.max-w-md", text: "More")
  end
end
