require 'rake/testtask'
require 'rubygems'
require 'rake/gempackagetask'

Rake::TestTask.new(:test) do |t|
  puts Dir.getwd
  t.libs << "lib"
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end
Rake::Task['test'].comment = "Run the unit tests"

spec = Gem::Specification.new do |s|
  s.name              = "env_based_config"
  s.version           = "0.0.1"
  s.author            = "Alex Dean"
  s.email             = "alex at crackpot dot org"
  s.homepage          = "http://github.com/alex_dean/env_based_config"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Store configuration data using YAML."
  s.description       = "EnvBasedConfig allows you to create a single YAML file defining configuration values for several environments (like Rails' config/database.yml)."
  s.files             = [ "README", "LICENSE", "lib/env_based_config.rb", "test/env_based_config_test.rb" ]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end
