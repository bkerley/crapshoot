$:.push File.expand_path("../lib", __FILE__)
require "crapshoot/version"

Gem::Specification.new do |s|
  s.name = 'crapshoot'
  s.version = Crapshoot::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bryce Kerley"]
  s.description = "Crapshoot is a dice-rolling gem for most of your pen-and-paper gaming needs; roll 4d6v to find out how much time it will save."
  s.email = "bkerley@brycekerley.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage = %q{http://github.com/bkerley/crapshoot}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The alpha and omega of rolling dice}
  s.required_ruby_version = '~> 1.9.2'

  s.add_development_dependency(%q<rake>, ['~> 0.9.2'])
  s.add_development_dependency(%q<guard-test>, ["~> 0.1.4"])
  s.add_development_dependency(%q<shoulda>, ["~> 2.11.3"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0.7"])
end

