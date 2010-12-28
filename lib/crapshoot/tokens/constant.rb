module Crapshoot
  module Tokens
    class Constant < Base
      def initialize(number)
        @value = number.to_i
      end

      def eval(stack)
        return @value
      end
    end
  end
end
