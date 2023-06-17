# frozen_string_literal: true

require "test_helper"

class SailboatComponentsTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert SailboatComponents::VERSION::STRING
  end
end
