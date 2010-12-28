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
  context 'The Crapshoot module' do
    should_roll '4d6', '>='=>4, '<='=>24
    should_roll '4d6 + 200', '>='=>204, '<='=>224
  end
end
