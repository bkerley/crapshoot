require 'helper'

class TestEvaluator < Test::Unit::TestCase
  include Crapshoot::Tokens
  def self.should_evaluate(from, options)
    keys = options.keys

    should "successfully evaluate #{from.inspect}" do
      result = @evaluator.evaluate from
      keys.each do |k|
        constraint = options[k]
        assert result.send(k.to_sym, constraint), "#{result} was not #{k} #{constraint}"
      end
    end
  end

  context 'an evaluator' do
    setup do
      @evaluator = Crapshoot::Evaluator.new
    end

    five = Constant.new '5'
    plus = Arithmetic.new '+'
    minus = Arithmetic.new '-'
    six = Constant.new '6'
    series1 = Series.new '5', '6', nil
    series2 = Series.new '4', '20', 'v'
    series3 = Series.new '20', '2'
    series4 = Series.new '20', '1', 'v'
    series5 = Series.new '20', '1', '^'

    should_evaluate [five, six, plus], '=='=> 11
    should_evaluate [series1, series1, plus], '>=' => 10, '<=' => 60
    should_evaluate [five, series2, plus], '>=' => 8, '<=' => 65
    should_evaluate [series3], '>=' => 20, '<=' => 40
    should_evaluate [series4], '=='=>19
    should_evaluate [series5], '=='=>19
  end
end
