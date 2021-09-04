# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rubysmith::CLI::Configuration::Content do
  using Refinements::Structs

  subject(:content) { described_class[project_name: "test"] }

  let(:template_root) { Bundler.root.join "lib", "rubysmith", "templates" }
  let(:build_root) { Bundler.root }

  describe "#initialize" do
    let :proof do
      {
        config: nil,
        template_root: template_root,
        template_path: nil,
        build_root: build_root,
        project_name: nil,
        author_name: nil,
        author_email: nil,
        author_url: nil,
        now: nil,
        documentation_format: nil,
        documentation_license: nil,
        build_minimum: nil,
        build_amazing_print: nil,
        build_bundler_leak: nil,
        build_console: nil,
        build_documentation: nil,
        build_git: nil,
        build_git_lint: nil,
        build_guard: nil,
        build_pry: nil,
        build_reek: nil,
        build_refinements: nil,
        build_rspec: nil,
        build_rubocop: nil,
        build_ruby_critic: nil,
        build_simple_cov: nil,
        build_zeitwerk: nil,
        builders_pragmater_comments: nil,
        builders_pragmater_includes: nil,
        version: nil,
        help: nil
      }
    end

    it "answers default hash" do
      expect(described_class.new).to have_attributes(proof)
    end
  end

  describe "#with" do
    it "answers combination of old and new struct with single attribute" do
      proof = described_class[project_name: "test", help: true]
      expect(content.with(help: true)).to eq(proof)
    end

    it "answers combination of old and new struct with multiple attributes" do
      proof = described_class[project_name: "test", build_console: true, build_pry: true]
      expect(content.with(project_name: "test", build_console: true, build_pry: true)).to eq(proof)
    end
  end

  describe "#project_label" do
    it "answers capitalized project label with single project name" do
      expect(content.project_label).to eq("Test")
    end

    it "answers titleized label with underscored project name" do
      updated_content = content.merge project_name: "test_underscore"
      expect(updated_content.project_label).to eq("Test Underscore")
    end

    it "answers titleized project label with dashed project name" do
      updated_content = content.merge project_name: "test-dash"
      expect(updated_content.project_label).to eq("Test Dash")
    end
  end

  describe "#project_class" do
    it "answers capitalized project class with single project name" do
      expect(content.project_class).to eq("Test")
    end

    it "answers camelcased project class with underscored project name" do
      updated_content = content.merge project_name: "test_underscore"
      expect(updated_content.project_class).to eq("TestUnderscore")
    end

    it "answers namespaced project class with dashed project name" do
      updated_content = content.merge project_name: "test-dash"
      expect(updated_content.project_class).to eq("Test::Dash")
    end
  end

  describe "#project_root" do
    it "answers unchanged project root path with single project name" do
      expect(content.project_root).to eq(Bundler.root.join("test"))
    end

    it "answers unchanged project root path with underscored project name" do
      updated_content = content.merge project_name: "test_underscore"
      expect(updated_content.project_root).to eq(Bundler.root.join("test_underscore"))
    end

    it "answers unchanged project root path with dashed project name" do
      updated_content = content.merge project_name: "test-dash"
      expect(updated_content.project_root).to eq(Bundler.root.join("test-dash"))
    end
  end

  describe "#project_path" do
    it "answers single project path with single project name" do
      expect(content.project_path).to eq("test")
    end

    it "answers underscored project path with underscored project name" do
      updated_content = content.merge project_name: "test_underscore"
      expect(updated_content.project_path).to eq("test_underscore")
    end

    it "answers nested project path with dashed project name" do
      updated_content = content.merge project_name: "test-dash"
      expect(updated_content.project_path).to eq("test/dash")
    end
  end

  describe "#to_pathway" do
    it "answers pathway" do
      expect(content.to_pathway).to eq(
        Rubysmith::Pathway[start_root: template_root, end_root: build_root]
      )
    end
  end
end
