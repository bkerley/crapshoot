
# line 1 "lib/crapshoot/parser/scan.rl"

# line 33 "lib/crapshoot/parser/scan.rl"


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
        
# line 25 "lib/crapshoot/parser/scan.rb"
class << self
	attr_accessor :_scanner_trans_keys
	private :_scanner_trans_keys, :_scanner_trans_keys=
end
self._scanner_trans_keys = [
	0, 0, 48, 57, 9, 45, 
	9, 57, 48, 57, 9, 
	100, 9, 118, 9, 45, 
	9, 45, 0
]

class << self
	attr_accessor :_scanner_key_spans
	private :_scanner_key_spans, :_scanner_key_spans=
end
self._scanner_key_spans = [
	0, 10, 37, 49, 10, 92, 110, 37, 
	37
]

class << self
	attr_accessor :_scanner_index_offsets
	private :_scanner_index_offsets, :_scanner_index_offsets=
end
self._scanner_index_offsets = [
	0, 0, 11, 49, 99, 110, 203, 314, 
	352
]

class << self
	attr_accessor :_scanner_indicies
	private :_scanner_indicies, :_scanner_indicies=
end
self._scanner_indicies = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 2, 2, 2, 2, 2, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 2, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 3, 1, 3, 
	1, 3, 3, 3, 3, 3, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	3, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 1, 5, 5, 
	5, 5, 5, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 5, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	6, 1, 6, 1, 1, 7, 7, 7, 
	7, 7, 7, 7, 7, 7, 7, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 8, 1, 9, 9, 9, 9, 9, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 9, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 10, 1, 10, 
	1, 1, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	12, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	13, 1, 2, 2, 2, 2, 2, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 2, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 3, 1, 3, 1, 
	14, 14, 14, 14, 14, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 14, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 15, 1, 15, 1, 0
]

class << self
	attr_accessor :_scanner_trans_targs
	private :_scanner_trans_targs, :_scanner_trans_targs=
end
self._scanner_trans_targs = [
	5, 0, 2, 3, 6, 2, 3, 5, 
	4, 2, 3, 6, 7, 8, 2, 3
]

class << self
	attr_accessor :_scanner_trans_actions
	private :_scanner_trans_actions, :_scanner_trans_actions=
end
self._scanner_trans_actions = [
	1, 0, 0, 0, 1, 2, 2, 0, 
	3, 3, 3, 0, 3, 3, 4, 4
]

class << self
	attr_accessor :_scanner_eof_actions
	private :_scanner_eof_actions, :_scanner_eof_actions=
end
self._scanner_eof_actions = [
	0, 0, 0, 0, 0, 2, 3, 0, 
	4
]

class << self
	attr_accessor :scanner_start
end
self.scanner_start = 1;
class << self
	attr_accessor :scanner_first_final
end
self.scanner_first_final = 5;
class << self
	attr_accessor :scanner_error
end
self.scanner_error = 0;

class << self
	attr_accessor :scanner_en_main
end
self.scanner_en_main = 1;


# line 52 "lib/crapshoot/parser/scan.rl"
        
# line 159 "lib/crapshoot/parser/scan.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = scanner_start
end

# line 53 "lib/crapshoot/parser/scan.rl"
        
# line 168 "lib/crapshoot/parser/scan.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = cs << 1
	_inds = _scanner_index_offsets[cs]
	_slen = _scanner_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_scanner_trans_keys[_keys] <= data[p] && 
			data[p] <= _scanner_trans_keys[_keys + 1] 
		    ) then
			_scanner_indicies[ _inds + data[p] - _scanner_trans_keys[_keys] ] 
		 else 
			_scanner_indicies[ _inds + _slen ]
		 end
	cs = _scanner_trans_targs[_trans]
	if _scanner_trans_actions[_trans] != 0
	case _scanner_trans_actions[_trans]
	when 1 then
# line 4 "lib/crapshoot/parser/scan.rl"
		begin
 @mark_num = p 		end
# line 4 "lib/crapshoot/parser/scan.rl"
	when 3 then
# line 5 "lib/crapshoot/parser/scan.rl"
		begin
 @num_stack.push atos(data[@mark_num..p-1]) 		end
# line 5 "lib/crapshoot/parser/scan.rl"
	when 4 then
# line 17 "lib/crapshoot/parser/scan.rl"
		begin
 @drop_current = data[p-1].chr 		end
# line 17 "lib/crapshoot/parser/scan.rl"
	when 2 then
# line 5 "lib/crapshoot/parser/scan.rl"
		begin
 @num_stack.push atos(data[@mark_num..p-1]) 		end
# line 5 "lib/crapshoot/parser/scan.rl"
# line 7 "lib/crapshoot/parser/scan.rl"
		begin
 @tokens << Tokens::Constant.new(@num_stack.pop) 		end
# line 7 "lib/crapshoot/parser/scan.rl"
# line 228 "lib/crapshoot/parser/scan.rb"
	end
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	  case _scanner_eof_actions[cs]
	when 3 then
# line 5 "lib/crapshoot/parser/scan.rl"
		begin
 @num_stack.push atos(data[@mark_num..p-1]) 		end
# line 5 "lib/crapshoot/parser/scan.rl"
	when 4 then
# line 17 "lib/crapshoot/parser/scan.rl"
		begin
 @drop_current = data[p-1].chr 		end
# line 17 "lib/crapshoot/parser/scan.rl"
	when 2 then
# line 5 "lib/crapshoot/parser/scan.rl"
		begin
 @num_stack.push atos(data[@mark_num..p-1]) 		end
# line 5 "lib/crapshoot/parser/scan.rl"
# line 7 "lib/crapshoot/parser/scan.rl"
		begin
 @tokens << Tokens::Constant.new(@num_stack.pop) 		end
# line 7 "lib/crapshoot/parser/scan.rl"
# line 265 "lib/crapshoot/parser/scan.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 54 "lib/crapshoot/parser/scan.rl"
        return @tokens
      end

      def atos(a)
        a.map(&:chr).join
      end
    end
  end
end
