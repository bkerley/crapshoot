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

    should 'behave like an integer'
  end
end
