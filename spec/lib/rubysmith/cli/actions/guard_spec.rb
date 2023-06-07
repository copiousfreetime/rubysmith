# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rubysmith::CLI::Actions::Guard do
  subject(:action) { described_class.new input: }

  let(:input) { configuration.dup }

  include_context "with application dependencies"

  describe "#call" do
    it "answers true by default" do
      action.call
      expect(input.build_guard).to be(true)
    end

    it "answers false when given false" do
      action.call false
      expect(input.build_guard).to be(false)
    end
  end
end
