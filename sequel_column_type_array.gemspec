# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sequel_column_type_array/version"

Gem::Specification.new do |s|
  s.name        = "sequel_column_type_array"
  s.version     = SequelColumnTypeArray::VERSION
  s.authors     = ["Corin Langosch"]
  s.email       = ["info@corinlangosch.com"]
  s.homepage    = "https://github.com/gucki/sequel_column_type_array"
  s.summary     = %q{Allow easy use of array column types with databases that support them}
  s.description = %q{Handles the typecasting of array columns so they can be used as any other datatype.}

  s.rubyforge_project = "sequel_column_type_array"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

