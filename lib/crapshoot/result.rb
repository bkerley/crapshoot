module Crapshoot
  # An Integer with a description, uses DelegateClass from the stdlib to do this
  class Result < DelegateClass(Integer)
    # Creates a new result with the given value.
    #
    # Everything except the description is delegated to this value.
    def initialize(value)
      super value
    end

    # The derivation of the result, as a String.
    attr_accessor :description

    # The derivation of the result, broken down by tokens, as an Array.
    attr_accessor :detailed_description
  end
end
