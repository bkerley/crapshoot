require 'active_support'
%w{ scanner postfixer evaluator }.each do |f|
  require File.join(File.dirname(__FILE__), 'crapshoot', f)
end

module Crapshoot
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
