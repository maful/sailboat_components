# frozen_string_literal: true

require_relative "lib/sailboat_components/version"

Gem::Specification.new do |spec|
  spec.name        = "sailboat_components"
  spec.version     = SailboatComponents::VERSION::STRING
  spec.authors     = ["maful"]
  spec.email       = ["me@maful.web.id"]
  spec.homepage    = "https://github.com/maful/sailboat_components"
  spec.summary     = "ViewComponents for the Sailboat UI."
  spec.license     = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"] - Dir["lib/**/*.rake"]
  end

  spec.add_runtime_dependency("actionview", ">= 7.0.5")
  spec.add_runtime_dependency("activesupport", ">= 7.0.5")
  spec.add_runtime_dependency("view_component", [">= 3.2", "< 4.0"])

  spec.add_development_dependency("capybara", "~> 3")
  spec.add_development_dependency("cuprite", "= 0.13")
  spec.add_development_dependency("minitest", "~> 5.18")
  spec.add_development_dependency("pry")
  spec.add_development_dependency("rubocop", "~> 1.52")
  spec.add_development_dependency("rubocop-performance", "~> 1.18")
  spec.add_development_dependency("rubocop-shopify", "~> 2.14")
  spec.add_development_dependency("sprockets")
  spec.add_development_dependency("sprockets-rails")
end
