# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memo_rage/version"

Gem::Specification.new do |s|
  s.name        = "memo_rage"
  s.version     = MemoRage::VERSION
  s.authors     = ["Alex Ganov", "Todor Grudev"]
  s.email       = ["aganov@gmail.com", "tagrudev@gmail.com"]
  s.homepage    = "http://github.com/appsbakery/memo_rage"
  s.summary     = %q{Ruby wrapper for the TVRage API}
  s.description = %q{An object-oriented Ruby wrapper for the TVRage API http://services.tvrage.com/}

  s.rubyforge_project = "memo_rage"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency "nokogiri", "~> 1.5"
  s.add_runtime_dependency "httpclient", "~> 2.0"
  s.add_runtime_dependency "activesupport", "~> 3.0"

  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "webmock", "~> 1.6"
end
