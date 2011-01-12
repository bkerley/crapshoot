require 'helper'

class TestResult < Test::Unit::TestCase
  context 'a result' do
    setup do
      @result = Crapshoot::Result.new 5
    end

    should 'have a description' do
      assert_respond_to @result, :description
      assert_respond_to @result, :description=
    end

    should 'behave like an integer' do
      assert_equal 11, (@result + 6)
      assert_equal 1, (@result / 5)
    end
  end
end
