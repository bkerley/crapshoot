module Crapshoot
  class Postfixer
    def postfixify(infix_tokens)
      @infix_orig = infix_tokens
      @infix = @infix_orig.dup
      @postfix = []
      until @infix.empty?
        step
      end

      return @postfix
    end

    def step
      candidate = @infix.shift
      unless candidate.independent
        dependency = @infix.shift
        @postfix.push dependency
      end
      @postfix.push candidate
    end
  end
end
