# frozen_string_literal: true

require "rake/testtask"

namespace :test do
  desc "Run all tests"
  task all: [
    :components,
    :lib,
  ]

  Rake::TestTask.new(:single) do |t|
    t.warning = false
    t.libs << "test"
    t.libs << "lib"
    t.test_files = FileList[ENV["TEST"]]
  end

  Rake::TestTask.new(:components) do |t|
    t.warning = false
    t.libs << "test"
    t.test_files = FileList[
      "test/components/**/*_test.rb"
    ]
  end

  Rake::TestTask.new(:lib) do |t|
    t.warning = false
    t.libs << "test"
    t.libs << "lib"
    t.test_files = FileList[
      "test/lib/**/*_test.rb"
    ]
  end
end

task :test do
  if ENV["TEST"]
    Rake::Task["test:single"].invoke
  else
    Rake::Task["test:all"].invoke
  end
end
