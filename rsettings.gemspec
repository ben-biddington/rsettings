# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rsettings"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Biddington"]
  s.date = "2013-12-11"
  s.description = "Settings"
  s.email = "ben.biddington@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rsettings",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rsettings.rb",
    "lib/rsettings/adapters/basic_disk_settings.rb",
    "lib/rsettings/adapters/environment_settings.rb",
    "lib/rsettings/internal/rsettings.rb",
    "lib/rsettings/internal/setting.rb",
    "lib/rsettings/internal/settings_chain.rb",
    "lib/rsettings/internal/settings_configuration.rb",
    "rsettings.gemspec",
    "settings.gemspec",
    "spec/integration.tests/adapters/basic_disk_settings_spec.rb",
    "spec/spec_helper.rb",
    "spec/system.tests/can_fall_back_to_file_settings_spec.rb",
    "spec/system.tests/can_specify_flags_spec.rb",
    "spec/system.tests/can_use_env_spec.rb",
    "spec/system.tests/options_spec.rb"
  ]
  s.homepage = "http://github.com/ben-biddington/rsettings"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Settings for ruby programs"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<audible>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
    else
      s.add_dependency(%q<audible>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    end
  else
    s.add_dependency(%q<audible>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
  end
end

