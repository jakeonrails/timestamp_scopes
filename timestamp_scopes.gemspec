# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timestamp_scopes/version'

Gem::Specification.new do |gem|
  gem.name          = "timestamp_scopes"
  gem.version       = TimestampScopes::VERSION
  gem.authors       = ["Jake Moffatt"]
  gem.email         = ["jakeonrails@gmail.com"]
  gem.summary       = "ActiveRecord scopes for timestamp columns with handy DSL"
  gem.homepage      = "https://github.com/jakeonrails/timestamp_scopes"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end