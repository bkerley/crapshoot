 guard 'test', :runner => 'fastfail' do
   watch('^lib/(.*)\.rb')        { |m| "test/#{m[1]}_test.rb" }
   watch('^lib/crapshoot/(.*)\.rb') { |m| 'test/#{m[1]}_test.rb'}
   watch('^test/(.*)_test.rb')
   watch('^test/helper.rb') { 'rake test' }
 end
