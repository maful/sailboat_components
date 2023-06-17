# frozen_string_literal: true

require "components/test_helper"

class PrimerBaseComponentTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders_data_view_component
    render_inline(Sailboat::BaseComponent.new(tag: :div))

    assert_selector("div[data-sailboat-component]")
  end

  def test_renders_title
    render_inline(Sailboat::BaseComponent.new(tag: :div, title: "title"))

    assert_selector("[title='title']")
  end

  def test_renders_content
    render_inline(Sailboat::BaseComponent.new(tag: :div)) do
      "content"
    end

    assert_text("content")
  end

  def test_skips_rendering_class_if_value_is_nil
    result = render_inline(Sailboat::BaseComponent.new(tag: :div, my: nil))

    assert(result.css("div").first.attribute("class").nil?)
  end

  def test_renders_arbitrary_attributes
    render_inline(Sailboat::BaseComponent.new(tag: :div, "data-url": "https://github.com/maful/sailboat_components"))

    assert_selector("[data-url='https://github.com/maful/sailboat_components']")
  end

  def test_renders_arbitrary_class_names
    render_inline(Sailboat::BaseComponent.new(tag: :div, classes: "bg-green-100"))

    assert_selector(".bg-green-100")
  end

  def test_renders_arbitrary_blank_attributes
    render_inline(Sailboat::BaseComponent.new(tag: :div, itemscope: true))

    assert_selector("[itemscope]")
  end

  def test_conditionally_renders_arbitrary_blank_attributes
    render_inline(Sailboat::BaseComponent.new(tag: :div, itemscope: false))

    refute_selector("[itemscope]")
  end

  def test_does_not_render_class_attribute_if_none_is_set
    render_inline(Sailboat::BaseComponent.new(tag: :div, title: "title"))

    refute_selector("div[class='']")
  end

  def test_renders_as_a_link
    render_inline(Sailboat::BaseComponent.new(tag: :a, href: "https://github.com/maful/sailboat_components"))

    assert_selector("a[href='https://github.com/maful/sailboat_components']")
  end

  def test_renders_data_attributes
    render_inline(Sailboat::BaseComponent.new(tag: :div, data: { controller: "dropdown" }))

    assert_selector("[data-controller='dropdown']")
  end

  def test_renders_height_attribute
    render_inline(Sailboat::BaseComponent.new(tag: :div, height: 30))

    assert_selector("div[height=30]")
  end

  def test_renders_width_attribute
    render_inline(Sailboat::BaseComponent.new(tag: :div, width: 30))

    assert_selector("div[width=30]")
  end

  def test_renders_content_with_raise_on_invalid_options
    with_raise_on_invalid_options(true) do
      render_inline(Sailboat::BaseComponent.new(tag: :div)) do
        "content"
      end

      assert_text("content")
    end
  end
end
