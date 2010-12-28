module Crapshoot
  module Tokens
    class Series
      def initialize(count, sides, drop = nil)
        @count = count.to_i
        @sides = sides.to_i
        @drop = drop
      end
    end
  end
end
