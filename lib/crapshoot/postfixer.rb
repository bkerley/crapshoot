module Crapshoot
  # Translate the infix-notation tokens into postfix notation to make evaluating them easier.
  class Postfixer

    # Postfixify turns the infix list of tokens from Scanner into a postfix list
    # by repeatedly calling "step"
    def postfixify(infix_tokens)
      @infix_orig = infix_tokens
      @infix = @infix_orig.dup
      @postfix = []
      @operator_stack = []
      until @infix.empty?
        step
      end

      until @operator_stack.empty?
        @postfix.push @operator_stack.pop
      end

      return @postfix
    end

    # step shifts an independent (Constant or Series) token to the
    # postfix list, or loads a dependent (Arithmetic) token into the
    # operator_stack for future postfixing.
    def step
      candidate = @infix.shift
      process_independent candidate
      process_operator candidate
    end

    def process_independent(candidate)
      return unless candidate.independent
      @postfix.push candidate
    end

    def process_operator(candidate)
      return if candidate.independent

      if @operator_stack.empty? || candidate.precedent(@operator_stack.last)
        @operator_stack.push candidate
      else
        @postfix.push @operator_stack.pop
        @operator_stack.push candidate
      end
    end
  end
end
