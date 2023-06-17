require_relative "boot"

# Pick the frameworks you want:
require "action_controller/railtie"
require "action_view/railtie"
require "active_model/railtie"
require "sprockets/railtie"
require "view_component"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.view_component.default_preview_layout = "component_preview"
    config.view_component.show_previews = true
    config.view_component.preview_paths << Rails.root.join("..", "previews")

    if config.respond_to?(:lookbook)
      config.lookbook.project_name = "Sailboat Components v#{SailboatComponents::VERSION::STRING}"
      config.lookbook.page_paths = [Rails.root.join("..", "previews", "pages")]
    end
  end
end
