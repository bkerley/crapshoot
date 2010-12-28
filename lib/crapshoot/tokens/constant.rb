module Crapshoot
  module Tokens
    class Constant < Base
      def initialize(number)
        @value = number.to_i
      end
    end
  end
end
