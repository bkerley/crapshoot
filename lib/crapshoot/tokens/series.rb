module Crapshoot
  module Tokens
    class Series < Base
      def initialize(count, sides, drop = nil)
        @count = count.to_i
        @sides = sides.to_i
        @drop = drop
      end

      def eval(stack)
        results_array = (1..@count).to_a.map{ roll_a_die }.sort
        @result = results_array.inject(&:+)
        roll_description = results_array.join '+'

        case @drop
        when '^'
          max = results_array[0]
          @result -= max
          roll_description += '-#{max}'
        when 'v'
          min = results_array[-1]
          @result -= min
          roll_description += '-#{min}'
        end
        @description = "(#{roll_description})"

        return @result
      end

      def inspect
        "<Crapshoot::Tokens::Series dice=#{@count}d#{@sides} drop=#{@drop or 'nothing'}>"
      end

      private

      def roll_a_die
        # +1 because we can roll a zero
        ActiveSupport::SecureRandom.random_number(@sides) + 1
      end
    end
  end
end
