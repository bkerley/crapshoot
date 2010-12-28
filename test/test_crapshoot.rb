require 'helper'

class TestCrapshoot < Test::Unit::TestCase
  context 'the expression "4d6 + 200"' do
    setup do
      @expression = "4d6 + 200"
    end

    should 'have a result over 200' do
      assert Crapshooot.roll(@expression) > 200
    end
  end
end
