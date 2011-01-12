module Crapshoot
  class Result < DelegateClass(Integer)
    def initialize(value)
      super value
    end
    attr_accessor :description
  end
end
