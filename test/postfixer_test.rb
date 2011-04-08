require 'helper'

class TestPostfixer < Test::Unit::TestCase
  include Crapshoot::Tokens
  def self.should_postfixify(from, to)
    should "postfixify #{from.inspect} to #{to.inspect}" do
      candidate = @postfixer.postfixify from
      assert_equal to, candidate
    end
  end
  context 'a postfixer' do
    setup do
      @postfixer = Crapshoot::Postfixer.new
    end

    five = Constant.new '5'
    six = Constant.new '6'
    seven = Constant.new '7'
    plus = Arithmetic.new '+'
    minus = Arithmetic.new '-'
    times = Arithmetic.new '*'
    series1 = Series.new '5', '6', nil
    series2 = Series.new '4', '20', 'v'

    should_postfixify([five, plus, six],
                      [five, six, plus])
    should_postfixify([series1, plus, six, minus, series2],
                      [series1, six, plus, series2, minus])
    should_postfixify([five, plus, six, times, seven],
                      [five, six, seven, times, plus])
  end
end
