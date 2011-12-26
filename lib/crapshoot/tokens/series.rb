module Crapshoot
  module Tokens
    class Series < Base
      def initialize(count, sides, drop = nil)
        @count = count.to_i
        @sides = sides.to_i
        @drop = drop
      end

      def eval(stack)
        raise TooManyDiceException.new(@count) if @count > 50_000
        results_array = (1..@count).to_a.map{ roll_a_die }.sort
        numeric_result = results_array.inject(&:+)
        roll_description = results_array.join '+'
        case @drop
        when '^'
          max = results_array.last
          numeric_result -= max
          roll_description += "-#{max}"
        when 'v'
          min = results_array.first
          numeric_result -= min
          roll_description += "-#{min}"
        end
        @result = Result.new numeric_result
        @result.description = "(#{roll_description})"
        @result.detailed_description = [["#{@count}d#{@sides}#{@drop}", roll_description]]

        return @result
      end

      def inspect
        "<Crapshoot::Tokens::Series dice=#{@count}d#{@sides} drop=#{@drop or 'nothing'}>"
      end

      private

      def roll_a_die
        # +1 because we can roll a zero
        SecureRandom.random_number(@sides) + 1
      end

      class TooManyDiceException < RuntimeError
        def initialize(number_of_dice)
          @number_of_dice = number_of_dice
          super "#{@number_of_dice} dice is too many"
        end
      end
    end
  end
end
