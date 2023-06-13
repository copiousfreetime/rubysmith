# frozen_string_literal: true

require "refinements/structs"
require "sod"

module Rubysmith
  module CLI
    module Actions
      # Stores conduct flag.
      class Conduct < Sod::Action
        include Import[:input]

        using ::Refinements::Structs

        description "Add code of conduct documentation."

        on "--[no-]conduct"

        default { Container[:configuration].build_conduct }

        def call(value = default) = input.merge!(build_conduct: value)
      end
    end
  end
end