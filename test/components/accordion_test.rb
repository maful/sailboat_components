# frozen_string_literal: true

require "components/test_helper"

class AccordionTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Accordion.new) do |c|
      c.with_summary do
        "Summary"
      end
      c.with_body do
        "Body"
      end
    end

    assert_selector(".accordion", text: "Body")
    assert_selector(".accordion > .accordion__summary", text: "Summary")
    assert_selector(".accordion > .accordion__summary > .accordion__caret")
  end

  def test_renders_if_caret_false
    render_inline(Sailboat::Accordion.new) do |c|
      c.with_summary(caret: false) do
        "Summary"
      end
      c.with_body do
        "Body"
      end
    end

    assert_selector(".accordion", text: "Body")
    assert_selector(".accordion > .accordion__summary", text: "Summary")
    refute_selector(".accordion > .accordion__summary > .accordion__caret")
  end

  def test_renders_custom_classes
    render_inline(Sailboat::Accordion.new(classes: "foo")) do |c|
      c.with_summary do
        "Summary"
      end
      c.with_body do
        "Body"
      end
    end

    assert_selector(".accordion.foo", text: "Body")
  end
end
