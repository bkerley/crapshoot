module Crapshoot
  module Tokens
    class Constant < Base
      def initialize(number)
        @value = Result.new number.to_i
        @value.description = @value.to_s
      end

      def eval(stack)
        return @value
      end

      def inspect
        "<Crapshoot::Tokens::Constant value=#{@value}>"
      end
    end
  end
end
