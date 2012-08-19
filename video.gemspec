# -*- encoding: utf-8 -*-
require File.expand_path('../lib/video/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sam Buna"]
  gem.email         = ["codective@gmail.com"]
  gem.description   = %q{Parse and consume video links}
  gem.summary       = %q{Parse and consume video links}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "video"
  gem.require_paths = ["lib"]
  gem.version       = Video::VERSION

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('pry')
end
