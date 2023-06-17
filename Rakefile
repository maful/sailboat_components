# frozen_string_literal: true

$stdout.sync = true

require "bundler/setup"

load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"
require "rake/testtask"

Rake.add_rakelib("lib/tasks")

task default: :test
