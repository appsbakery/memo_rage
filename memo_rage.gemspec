# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memo_rage/version"

Gem::Specification.new do |s|
  s.name        = "memo_rage"
  s.version     = MemoRage::VERSION
  s.authors     = ["Todor Grudev"]
  s.email       = ["tagrudev@gmail.com"]
  s.homepage    = "http://github.com/appsbakery/memo_rage"
  s.summary     = %q{API Wrapper for TVRage}
  s.description = %q{API Wrapper for TVRage}

  s.rubyforge_project = "memo_rage"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nokogiri", "~> 1.5.0"
  s.add_runtime_dependency "httpclient", ">= 2.2.0.2"
  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "rspec", ">= 2"
  s.add_development_dependency "webmock", ">= 1.6.2"
  s.add_development_dependency "timecop", ">= 0.3.5"
end
