# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "rsettings"
  gem.homepage = "http://github.com/ben-biddington/rsettings"
  gem.license = "MIT"
  gem.summary = %Q{Settings for ruby programs}
  gem.description = %Q{Settings}
  gem.email = "ben.biddington@gmail.com"
  gem.authors = ["Ben Biddington"]
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

desc "Run all the tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "spec/**/_spec.rb"
end

task :default => :test
