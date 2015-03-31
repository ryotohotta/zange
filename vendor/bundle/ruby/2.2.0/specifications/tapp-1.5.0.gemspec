# -*- encoding: utf-8 -*-
# stub: tapp 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tapp"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Keita Urashima"]
  s.date = "2015-02-24"
  s.description = "tap { pp self }"
  s.email = ["ursm@ursm.jp"]
  s.executables = ["tapp"]
  s.files = ["bin/tapp"]
  s.homepage = "http://github.com/esminc/tapp"
  s.rubygems_version = "2.4.5"
  s.summary = "tap { pp self }"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_development_dependency(%q<turnip>, [">= 0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<turnip>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<turnip>, [">= 0"])
  end
end
