$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "squwak/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "squwak"
  s.version     = Squwak::VERSION
  s.authors     = ["Jimi Smoot"]
  s.email       = ["jsfour@gmail.com"]
  s.homepage    = "https://github.com/jsmootiv/squawk"
  s.summary     = "Universal indentifier for rails applications"
  s.description = "Universal indentifier for rails applications"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
end
