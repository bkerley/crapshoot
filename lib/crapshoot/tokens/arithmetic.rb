module Crapshoot
  module Tokens
    class Arithmetic < Base
      def initialize(operation)
        @operation = operation
      end

      def independent
        false
      end

      def eval(stack)
        r = stack.pop
        l = stack.pop
        @result = Result.new l.send(@operation.to_sym, r)
        @result.description = "#{l.description}#{@operation}#{r.description}"
        return @result
      end

      def inspect
        "<Crapshoot::Tokens::Arithmetic operation=#{@operation}>"
      end
    end
  end
end
