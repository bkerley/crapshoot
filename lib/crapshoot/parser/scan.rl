%%{
  machine scanner;

  action _number { @mark_num = p }
  action number { @num_stack.push atos(data[@mark_num..p-1]) }

  action constant { @tokens << Tokens::Constant.new(@num_stack.pop) }
  action series {
    drop = @drop_current
    @drop_current = nil
    sides = @num_stack.pop
    count = @num_stack.pop
    @tokens << Tokens::Series.new(count, sides, drop)
  }
  action arithmetic { @tokens << Tokens::Arithmetic.new(data[p-1].chr) }

  action drop { @drop_current = data[p-1].chr }

  Number = digit+ >_number %number;

  Constant = Number %constant;

  Drop = ('^' | 'v') %drop;
  Series = Number 'd' Number Drop? %series;

  Arithmetic = ('+' | '-') %arithmetic;

  UnaryExpression = Series | Constant;
  BinaryExpression = UnaryExpression (space* Arithmetic space* UnaryExpression)+;
  Expression = UnaryExpression | BinaryExpression;

  main := Expression;
}%%

module Crapshoot
  module Parser
    class Scan
      def initialize
        @tokens = []
        @num_stack = []
      end

      def parse(line)
        data = line.codepoints.to_a
        stack = []
        p = 0
        ts = 0
        te = 0
        act = 0
        eof = data.length
        %% write data;
        %% write init;
        %% write exec;
        return @tokens
      end

      def atos(a)
        a.map(&:chr).join
      end
    end
  end
end
