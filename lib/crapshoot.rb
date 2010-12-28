require 'treetop'
%w{ scanner postfixer }.each do |f|
  require File.join(File.dirname(__FILE__), 'crapshoot', f)
end
