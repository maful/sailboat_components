# frozen_string_literal: true

require "system/test_case"

class IntegrationAlertTest < System::TestCase
  def test_dismiss_button
    visit_preview(:playground, dismissible: true)
    assert_selector(".alert")

    find("button.alert__close").click

    refute_selector(".alert")
  end
end
