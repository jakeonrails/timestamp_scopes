# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timestamp_scopes/version'

Gem::Specification.new do |gem|
  gem.name          = "timestamp_scopes"
  gem.version       = TimestampScopes::VERSION
  gem.authors       = ["Jake Moffatt"]
  gem.email         = ["jakeonrails@gmail.com"]
  gem.summary       = "ActiveRecord scopes for timestamp columns"
  gem.description   = "Dynamically add useful timestamp scopes to your ActiveRecord models!"
  gem.homepage      = "https://github.com/jakeonrails/timestamp_scopes"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.12.0'
  gem.add_development_dependency 'sqlite3', '~> 1.3.3'
  gem.add_development_dependency 'activerecord', '~> 3.0'

end
