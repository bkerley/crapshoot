require File.join(File.dirname(__FILE__), 'parser', 'scan.rb')
%w{ base constant series arithmetic }.each do |f|
  require File.join(File.dirname(__FILE__), 'tokens', f)
end

module Crapshoot
  # Turns a string into an array of tokens.
  class Scanner
    def initialize
      @parser = Parser::Scan.new
    end

    def parse(line)
      @line = line
      begin
        @result = @parser.parse @line
        return @result
      rescue => e
        @exception = e
        return nil
      end
    end

    def successful?
      @result
    end

    def inspect_errors
      return 'No error' if successful?
      backtrace = @exception.backtrace
      filtered_backtrace = []
      backtrace.each do |i|
        break if i.include? __FILE__
        filtered_backtrace << i
      end
      return "#{ @exception.message } at #{ filtered_backtrace.join("\n")}"
    end
  end
end
