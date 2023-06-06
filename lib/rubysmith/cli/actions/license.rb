# frozen_string_literal: true

require "refinements/structs"
require "sod"

module Rubysmith
  module CLI
    module Actions
      # Stores license flag.
      class License < Sod::Action
        include Import[:inputs]

        using ::Refinements::Structs

        description "Add license documentation."

        on "--[no-]license"

        default { Container[:configuration].build_license }

        def call(value = default) = inputs.merge!(build_license: value)
      end
    end
  end
end
