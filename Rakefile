require 'bundler'
begin
  Bundler.setup(:default, :development)
  Bundler::GemHelper.install_tasks
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/*_test.rb'
  test.verbose = true
end

task :test => :scanner

desc 'Generate the Ragel scanner'
task :scanner => 'lib/crapshoot/parser/scan.rb'

file 'lib/crapshoot/parser/scan.rb' => ['lib/crapshoot/parser/scan.rl'] do |t|
  sh "ragel -R -F1  -o #{t.name} #{t.prerequisites.first}"
end

namespace :scanner do
  desc 'Generate a PDF graph of the Ragel scanner'
  task :pdf => 'doc/scan.pdf'
  file 'doc/scan.pdf' => ['doc/scan.dot', 'doc'] do |t|
    sh "dot -Tpdf -o #{t.name} #{t.prerequisites.first}"
  end

  file 'doc/scan.dot' => ['lib/crapshoot/parser/scan.rl', 'doc'] do |t|
    sh "ragel -Vp -o #{t.name} #{t.prerequisites.first}"
  end
end

directory 'doc'

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "crapshoot #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

