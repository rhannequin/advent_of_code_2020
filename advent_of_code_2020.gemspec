# frozen_string_literal: true

require_relative 'lib/advent_of_code_2020/version'

Gem::Specification.new do |spec|
  spec.name = "advent_of_code_2020"
  spec.version = AdventOfCode2020::VERSION
  spec.authors = ["rhannequin"]
  spec.email = ["hello@rhannequ.in"]

  spec.summary = "Advent of code 2020"
  spec.description = "Advent of code 2020"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
end
