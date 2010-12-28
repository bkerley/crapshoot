module Crapshoot
  module Tokens
    class Arithmetic < Base
      def initialize(operation)
        @operation = operation
      end

      def independent
        false
      end
    end
  end
end
