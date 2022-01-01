# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rubysmith::Builders::Bundler do
  using Refinements::Structs

  subject(:builder) { described_class.new test_configuration }

  include_context "with application container"

  let(:gemfile_path) { temp_dir.join "test", "Gemfile" }

  it_behaves_like "a builder"

  describe "#call" do
    context "with minimum options" do
      let(:test_configuration) { configuration.minimize }

      it "builds Gemfile" do
        builder.call

        expect(gemfile_path.read).to eq(<<~CONTENT)
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

        CONTENT
      end
    end

    context "with Amazing Print only" do
      let(:test_configuration) { configuration.minimize.merge build_amazing_print: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :tools do
            gem "amazing_print", "~> 1.4"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Bundler Leak only" do
      let(:test_configuration) { configuration.minimize.merge build_bundler_leak: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "bundler-leak", "~> 0.2"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Dead End only" do
      let(:test_configuration) { configuration.minimize.merge build_dead_end: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "dead_end", "~> 3.0"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Debug only" do
      let(:test_configuration) { configuration.minimize.merge build_debug: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :tools do
            gem "debug", "~> 1.4"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Git and Git Lint only" do
      let :test_configuration do
        configuration.minimize.merge build_git: true, build_git_lint: true
      end

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "git-lint", "~> 3.0"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Guard only" do
      let(:test_configuration) { configuration.minimize.merge build_guard: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :test do
            gem "guard-rspec", "~> 4.7", require: false
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Rake only" do
      let(:test_configuration) { configuration.minimize.merge build_rake: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :development do
            gem "rake", "~> 13.0"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Reek only" do
      let(:test_configuration) { configuration.minimize.merge build_reek: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "reek", "~> 6.0"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Refinements only" do
      let(:test_configuration) { configuration.minimize.merge build_refinements: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          gem "refinements", "~> 9.0"
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with RSpec only" do
      let(:test_configuration) { configuration.minimize.merge build_rspec: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :test do
            gem "rspec", "~> 3.10"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with RSpec and RuboCop only" do
      let :test_configuration do
        configuration.minimize.merge build_rspec: true, build_rubocop: true
      end

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "rubocop", "~> 1.24"
            gem "rubocop-performance", "~> 1.12"
            gem "rubocop-rake", "~> 0.6"
            gem "rubocop-rspec", "~> 2.6"
          end

          group :test do
            gem "rspec", "~> 3.10"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with RuboCop only" do
      let(:test_configuration) { configuration.minimize.merge build_rubocop: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "rubocop", "~> 1.24"
            gem "rubocop-performance", "~> 1.12"
            gem "rubocop-rake", "~> 0.6"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with SimpleCov only" do
      let(:test_configuration) { configuration.minimize.merge build_simple_cov: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :code_quality do
            gem "simplecov", "~> 0.21"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Zeitwerk only" do
      let(:test_configuration) { configuration.minimize.merge build_zeitwerk: true }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          gem "zeitwerk", "~> 2.5"
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with Markdown only" do
      let(:test_configuration) { configuration.minimize.merge documentation_format: "md" }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          group :development do
            gem "tocer", "~> 13.0"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end

    context "with all options" do
      let(:test_configuration) { configuration.maximize.merge documentation_format: "md" }

      let :proof do
        <<~CONTENT
          ruby File.read(".ruby-version").strip

          source "https://rubygems.org"

          gem "refinements", "~> 9.0"
          gem "zeitwerk", "~> 2.5"

          group :code_quality do
            gem "bundler-leak", "~> 0.2"
            gem "dead_end", "~> 3.0"
            gem "git-lint", "~> 3.0"
            gem "reek", "~> 6.0"
            gem "rubocop", "~> 1.24"
            gem "rubocop-performance", "~> 1.12"
            gem "rubocop-rake", "~> 0.6"
            gem "rubocop-rspec", "~> 2.6"
            gem "simplecov", "~> 0.21"
          end

          group :development do
            gem "rake", "~> 13.0"
            gem "tocer", "~> 13.0"
          end

          group :test do
            gem "guard-rspec", "~> 4.7", require: false
            gem "rspec", "~> 3.10"
          end

          group :tools do
            gem "amazing_print", "~> 1.4"
            gem "debug", "~> 1.4"
          end
        CONTENT
      end

      it "builds Gemfile" do
        builder.call
        expect(gemfile_path.read).to eq(proof)
      end
    end
  end
end
