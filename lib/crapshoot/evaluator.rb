module Crapshoot
  class Evaluator
    def evaluate(tokens)
      @stack = []
      @tokens = tokens.dup
      until @tokens.empty?
        step
      end

      raise 'Stack has too many entries' unless @stack.length == 1

      return @stack[0]
    end

    def step
      candidate = @tokens.shift
      @stack.push candidate.eval @stack
    end
  end
end
