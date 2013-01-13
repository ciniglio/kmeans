# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kmeans/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alejandro Ciniglio"]
  gem.email         = ["mail@alejandrociniglio.com"]
  gem.description   = %q{A Kmeans classifier written in ruby, good for fast classification}
  gem.summary       = %q{A Kmeans classifier written in ruby}
  gem.homepage      = "http://github.com/ciniglio/kmeans"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "caymans"
  gem.require_paths = ["lib"]
  gem.version       = Kmeans::VERSION
end
