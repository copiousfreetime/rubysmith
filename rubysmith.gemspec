# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "rubysmith"
  spec.version = "5.8.0"
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://alchemists.io/projects/rubysmith"
  spec.summary = "A command line interface for smithing Ruby projects."
  spec.license = "Hippocratic-2.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/bkuhlmann/rubysmith/issues",
    "changelog_uri" => "https://alchemists.io/projects/rubysmith/versions",
    "documentation_uri" => "https://alchemists.io/projects/rubysmith",
    "funding_uri" => "https://github.com/sponsors/bkuhlmann",
    "label" => "Rubysmith",
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/bkuhlmann/rubysmith"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = [">= 3.2", "<= 3.3"]
  spec.add_dependency "cogger", "~> 0.12"
  spec.add_dependency "dry-container", "~> 0.11"
  spec.add_dependency "dry-monads", "~> 1.6"
  spec.add_dependency "dry-schema", "~> 1.13"
  spec.add_dependency "etcher", "~> 0.2"
  spec.add_dependency "gitt", "~> 2.0"
  spec.add_dependency "infusible", "~> 2.2"
  spec.add_dependency "milestoner", "~> 16.0"
  spec.add_dependency "pragmater", "~> 13.0"
  spec.add_dependency "refinements", "~> 11.0"
  spec.add_dependency "rubocop", "~> 1.55"
  spec.add_dependency "runcom", "~> 10.0"
  spec.add_dependency "sod", "~> 0.0"
  spec.add_dependency "spek", "~> 2.0"
  spec.add_dependency "tocer", "~> 16.0"
  spec.add_dependency "tone", "~> 0.3"
  spec.add_dependency "zeitwerk", "~> 2.6"

  spec.bindir = "exe"
  spec.executables << "rubysmith"
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.files = Dir.glob ["*.gemspec", "lib/**/*"], File::FNM_DOTMATCH
end
