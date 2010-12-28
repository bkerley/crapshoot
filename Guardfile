 guard 'test', :runner => 'fastfail' do
   watch('^lib/(.*)\.rb')        { |m| "test/test_#{m[1]}.rb" }
   watch('^lib/crapshoot/(.*)\.rb') { |m| 'test/test_#{m[1]}.rb'}
   watch('^test/(.*)_test.rb') { 'rake test' }
   watch('^test/test_helper.rb') { 'rake test' }
 end
