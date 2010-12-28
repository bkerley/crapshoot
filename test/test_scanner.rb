require 'helper'

class TestScanner < Test::Unit::TestCase
  def self.should_parse(line)
    should "parse #{line.inspect}" do
      @scanner.parse(line)

      assert @scanner.successful?,
        "Failed to parse #{line}: #{@scanner.inspect_errors}"
    end
  end

  context 'a scanner' do
    setup do
      @scanner = Crapshoot::Scanner.new
    end

    should_parse '4'
    should_parse '4d6'
    should_parse '1 + 2'
    should_parse '1+2'
    should_parse '4d6 + 4d6'
    should_parse '4d6v'
    should_parse '4d6 + 2'
    should_parse '15'
    should_parse '14d100v + 8d8 + 3'

    should 'have an error string' do
      @scanner.parse 'fffff'
      assert @scanner.inspect_errors
    end
  end

end
