module Crapshoot
  # Stack-based calculator that relies on the "eval" method of tokens.
  class Evaluator
    def evaluate(tokens)
      @stack = []
      @tokens = tokens.dup
      until @tokens.empty?
        step
      end

      raise "Stack has too many entries: #{@stack.inspect}" unless @stack.length == 1

      return @stack[0]
    end

    def step
      candidate = @tokens.shift
      result = candidate.eval @stack
      @stack.push result
    end
  end
end
