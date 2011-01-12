require 'delegate'
require 'active_support'
%w{ result scanner postfixer evaluator }.each do |f|
  require File.join(File.dirname(__FILE__), 'crapshoot', f)
end

module Crapshoot

  # Rolls dice for the given expression.
  # @param [String] crapshoot expression to evaluate, such as '4d6v + 8'
  # @return [Crapshoot::Result] the result of the expression, can be used as a normal Integer
  def self.roll(expression)
    scanner = Scanner.new
    postfixer = Postfixer.new
    evaluator = Evaluator.new

    tokens = scanner.parse expression
    postfix_tokens = postfixer.postfixify tokens
    result = evaluator.evaluate postfix_tokens

    return result
  end
end
