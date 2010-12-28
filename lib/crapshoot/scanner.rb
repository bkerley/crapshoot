require File.join(File.dirname(__FILE__), 'scanner', 'scan.rb')

module Crapshoot
  class Scanner
    def initialize
      @parser = CrapshootScannerParser.new
    end

    def parse(line)
      @line = line
      @result = @parser.parse @line
      return @result
    end

    def successful?
      @result
    end

    def inspect_errors
      return 'No error' if successful?
      reason = @parser.failure_reason
      return 'No error reason' if reason.nil? || reason.empty?
      return reason
    end
  end
end
