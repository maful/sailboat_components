# frozen_string_literal: true

# First, load Cuprite Capybara integration
require "capybara/cuprite"

# Then, we need to register our driver to be able to use it later
# with #driven_by method.
# rubocop:disable Style/RedundantDoubleSplatHashBraces
Capybara.register_driver(:sailboat_cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    **{
      # Enable debugging capabilities
      inspector: true,
      # Allow running Chrome in a headful mode by setting HEADLESS env
      # var to a falsey value
      headless: !ENV["HEADLESS"].in?(["n", "0", "no", "false"]),
    },
  )
end
# rubocop:enable Style/RedundantDoubleSplatHashBraces

# Configure Capybara to use :cuprite driver by default
Capybara.default_driver = Capybara.javascript_driver = :cuprite
Capybara.save_path = "./test/snapshots"
Capybara.disable_animation = true
