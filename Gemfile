# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in sailboat_components.gemspec.
gemspec
rails_version = (ENV["RAILS_VERSION"] || "7.0.5").to_s

gem "rake", "~> 13.0"

gem "actionview", rails_version
gem "activemodel", rails_version
gem "activesupport", rails_version
gem "railties", rails_version

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

gem "lookbook", "~> 2.0.5"

# Use Puma as the app server
gem "puma", "~> 6.3.0"

group :test do
  gem "webmock"
end
