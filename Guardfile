 guard 'test' do
   watch('^lib/(.*)\.rb')        { |m| "test/#{m[1]}_test.rb" }
   watch('^test/(.*)_test.rb') { 'test' }
   watch('^test/test_helper.rb') { 'test' }
 end
