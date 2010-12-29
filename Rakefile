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
  gem.add_runtime_dependency 'activesupport', '~> 3.0'
  gem.add_development_dependency 'shoulda', '~> 2.11.3'
  gem.add_development_dependency 'bundler', '~> 1.0.7'
  gem.add_development_dependency 'jeweler', '~> 1.5.2'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
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
