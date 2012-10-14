# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "time_sentence/version"

Gem::Specification.new do |s|
  s.name        = "time_sentence"
  s.version     = TimeSentence::VERSION
  s.authors     = ["Pete Michaud"]
  s.email       = ["me@petermichaud.com"]
  s.homepage    = "http://github.com/PeteMichaud/time-sentence"
  s.summary     = "Translates Seconds into Human Readable Sentences"
  s.description = "Translates Seconds into Human Readable Sentences"
  s.rubyforge_project = "time_sentence"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["config", "lib"]

  #s.add_dependency 'activesupport', '~> 3.2'
  #s.add_dependency 'actionpack', '~> 3.2'

  s.add_development_dependency 'rake', '~> 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.10'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'minitest-rails', '~> 0.2'
  s.add_development_dependency 'minitest', '~> 3.0' if RUBY_PLATFORM == "java"
end