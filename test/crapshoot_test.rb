require 'helper'

class TestCrapshoot < Test::Unit::TestCase

  def self.should_roll(from, options)
    keys = options.keys

    should "successfully evaluate #{from.inspect}" do
      result = Crapshoot.roll from
      keys.each do |k|
        constraint = options[k]
        assert result.send(k.to_sym, constraint), "#{result} was not #{k} #{constraint}"
      end
    end
  end

  def self.should_describe(from, matcher)
    should "evaluate #{from.inspect} into something resembling #{matcher.inspect}" do
      result = Crapshoot.roll from
      assert_match matcher, result.description
    end
  end
  context 'The Crapshoot module' do
    should_roll '4d6', '>='=>4, '<='=>24
    should_roll '4d6 + 200', '>='=>204, '<='=>224

    should_describe '1 + 2', '1+2'
    should_describe '2d6', /\(\d\+\d\)/
    should_describe '2d6 + 5', /\(\d\+\d\)\+5/
    should_describe '2d6 + 5 + 4d2v', /\(\d\+\d\)\+5\+\(\d\+\d\+\d\+\d\-\d\)/
  end
end
