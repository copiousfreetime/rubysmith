# frozen_string_literal: true

require "refinements/structs"
require "sod"

module Rubysmith
  module CLI
    module Actions
      # Stores versions flag.
      class Versions < Sod::Action
        include Import[:inputs]

        using ::Refinements::Structs

        description "Add version history."

        on "--[no-]versions"

        default { Container[:configuration].build_versions }

        def call(value = default) = inputs.merge!(build_versions: value)
      end
    end
  end
end
