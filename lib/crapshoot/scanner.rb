require File.join(File.dirname(__FILE__), 'scanner', 'scan.rb')

module Crapshoot
  class Scanner
    def initialize
      @parser = CrapshootScannerParser.new
    end

    def parse(line)
      @line = line
      begin
        @result = @parser.parse @line
        return @result
      rescue e
        @exception = e
        return nil
      end
    end

    def successful?
      @result
    end

    def inspect_errors
      return 'No error' if successful?
      reason = @parser.failure_reason
      return 'No error reason' if (reason.nil? || reason.empty?) && (!@exception)
      return @exception.inspect if @exception
      return reason
    end
  end
end
