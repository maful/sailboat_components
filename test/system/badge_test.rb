# frozen_string_literal: true

require "system/test_case"

class IntegrationBadgeTest < System::TestCase
  def test_dismiss_button
    visit_preview(:playground, dismissible: true)
    assert_selector(".badge")

    find('button[aria-label="Close"]').click

    refute_selector(".badge")
  end
end
