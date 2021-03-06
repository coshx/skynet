# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "skynet/version"

Gem::Specification.new do |s|
  s.name        = "skynet-deploy"
  s.version     = Skynet::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Ahearn"]
  s.email       = ["ryan@coshx.com"]
  s.homepage    = "https://github.com/coshx/skynet"
  s.summary     = %q{Sinatra app that listens for GitHub post-receive callbacks and deploys your code}
  s.description = %q{Sinatra app that listens for GitHub post-receive callbacks and deploys your code}

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sinatra',       '~> 1.3'
  s.add_runtime_dependency 'thin',          '~> 1.4'
  s.add_runtime_dependency 'json',          '~> 1.7'
  s.add_runtime_dependency 'jekyll',        '~> 1.5'
  s.add_runtime_dependency 'thor',          '~> 0.16'
  s.add_runtime_dependency 'activesupport', '~> 4.0'
  s.add_runtime_dependency 'activemodel',   '~> 4.0'
  s.add_runtime_dependency 'multi_json',    '~> 1.0'

  s.add_development_dependency 'rake',             '~> 10.2'
  s.add_development_dependency 'rspec',            '~> 2.11'
  s.add_development_dependency 'shoulda-matchers', '~> 2.5'
end
