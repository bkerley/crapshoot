require 'treetop'
require 'active_support'
%w{ scanner postfixer evaluator }.each do |f|
  require File.join(File.dirname(__FILE__), 'crapshoot', f)
end
