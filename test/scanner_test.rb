require 'helper'

class TestScanner < Test::Unit::TestCase
  include Crapshoot::Tokens
  def self.should_parse(line, *sequence)
    should "parse #{line.inspect} without error" do
      @scanner.parse(line)

      assert @scanner.successful?,
        "Failed to parse #{line.inspect}: #{@scanner.inspect_errors}"
    end

    unless sequence.empty?
      should "parse #{line.inspect} into #{sequence.inspect}" do
        result = @scanner.parse(line)
        result.zip sequence do |r, c|
          assert_kind_of c, r
        end
      end
    end
  end

  context 'a scanner' do
    setup do
      @scanner = Crapshoot::Scanner.new
    end

    should_parse '4', Constant
    should_parse '4d6', Series
    should_parse '1 + 2', Constant, Arithmetic, Constant
    should_parse '1+2', Constant, Arithmetic, Constant
    should_parse '4d6 + 4d6', Series, Arithmetic, Series
    should_parse '4d6v', Series
    should_parse '4d6^', Series
    should_parse '4d6 + 2', Series, Arithmetic, Constant
    should_parse '15', Constant
    should_parse '14d100v + 8d8 + 3', Series, Arithmetic, Series, Arithmetic, Constant

    should 'have an error string' do
      @scanner.parse 'fffff'
      assert @scanner.inspect_errors
    end
  end

end
