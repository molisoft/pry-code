# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pry-code/version"

Gem::Specification.new do |s|
  s.name        = "pry-code"
  s.version     = PryCode::VERSION
  s.authors     = ["moli"]
  s.email       = ["molisoft@qq.com"]
  s.homepage    = "https://github.com/molisoft/pry-code"
  s.summary     = %q{Code your vscode}
  s.license     = "MIT"
  # s.description = %q{TODO: Write a gem description}

  # s.rubyforge_project = "pry-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "pry", ">= 0.9.10"
  s.add_development_dependency "appraisal"
  s.add_development_dependency "minitest"
  s.add_development_dependency "rr"
end
