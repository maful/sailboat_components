# frozen_string_literal: true

require "components/test_helper"

class AlertTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Alert.new) { "foo" }

    assert_selector(".alert.alert--info", text: "foo")
    refute_selector('[x-data="SailboatDismissible"]')
    refute_selector(".alert .alert__action")
    refute_selector(".alert .alert__close")
  end

  def test_renders_error_scheme
    render_inline(Sailboat::Alert.new(scheme: :error)) { "foo" }

    assert_selector(".alert.alert--error", text: "foo")
  end

  def test_renders_success_scheme
    render_inline(Sailboat::Alert.new(scheme: :success)) { "foo" }

    assert_selector(".alert.alert--success", text: "foo")
  end

  def test_renders_warning_scheme
    render_inline(Sailboat::Alert.new(scheme: :warning)) { "foo" }

    assert_selector(".alert.alert--warning", text: "foo")
  end

  def test_renders_alert_close
    render_inline(Sailboat::Alert.new(dismissible: true)) { "foo" }

    assert_selector('.alert[x-data="SailboatDismissible"][x-show="show"][x-cloak] .alert__close')
  end

  def test_renders_alert_action_slot
    render_inline(Sailboat::Alert.new) do |c|
      c.with_action { "submit" }
    end

    assert_selector(".alert .alert__action", text: "submit")
  end

  def test_renders_custom_class
    render_inline(Sailboat::Alert.new(classes: "bar")) { "foo" }

    assert_selector(".alert.bar", text: "foo")
  end
end
