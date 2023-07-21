# frozen_string_literal: true

require "components/test_helper"

class BreadcrumbsTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_does_not_render_if_no_items_provided
    render_inline(Sailboat::Breadcrumbs.new)

    refute_component_rendered
  end

  def test_renders_single_item
    render_inline(Sailboat::Breadcrumbs.new) do |c|
      c.with_item(href: "/") { "Home" }
    end

    assert_selector("nav[aria-label='breadcrumb'] .breadcrumb__item", text: "Home")
  end

  def test_renders_multiple_items
    render_inline(Sailboat::Breadcrumbs.new) do |c|
      c.with_item(href: "/") { "Home" }
      c.with_item(href: "/posts") { "Posts" }
      c.with_item(href: "/posts/details") { "Details" }
    end

    assert_selector("nav[aria-label='breadcrumb'] .breadcrumb__item", count: 3)
  end

  def test_renders_links_when_specified
    render_inline(Sailboat::Breadcrumbs.new) do |c|
      c.with_item(href: "/") { "Home" }
      c.with_item(href: "/posts") { "Posts" }
    end

    assert_selector("nav[aria-label='breadcrumb'] .breadcrumb__item a", count: 2)
    assert_selector("nav[aria-label='breadcrumb'] .breadcrumb__item:first-child a[href='/']")
    assert_selector("nav[aria-label='breadcrumb'] .breadcrumb__item:last-child a[href='/posts']")
  end

  def test_automatically_active_last_item
    render_inline(Sailboat::Breadcrumbs.new) do |c|
      c.with_item(href: "/") { "Home" }
      c.with_item(href: "/posts") { "Posts" }
    end

    assert_selector(
      "nav[aria-label='breadcrumb'] .breadcrumb__item.breadcrumb__item--selected a[aria-current='page']",
      text: "Posts",
    )
  end
end
