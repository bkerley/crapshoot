require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "crapshoot"
  gem.homepage = "http://github.com/bkerley/crapshoot"
  gem.license = "MIT"
  gem.summary = %Q{The alpha and omega of rolling dice}
  gem.description = %Q{Crapshoot is a dice-rolling gem that parses complicated notation for most of your pen-and-paper gaming needs.}
  gem.email = "bkerley@brycekerley.net"
  gem.authors = ["Bryce Kerley"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :test => :scanner

task :scanner => 'lib/crapshoot/scanner/scan.rb'

file 'lib/crapshoot/scanner/scan.rb' => ['lib/crapshoot/scanner/scan.treetop'] do |t|
  sh "tt #{t.prerequisites.first} -o #{t.name}"
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "crapshoot #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
