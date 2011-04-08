module Crapshoot
  module Tokens
    class Base
      def independent
        true
      end
      def precedent(stack_top)
        true
      end
    end
  end
end
