# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "kiki"
  gem.homepage = "http://github.com/mattt/kiki"
  gem.license = "MIT"
  gem.summary = %Q{A lightweight, flexible key generator for NoSQL / Key-Value stores, such as Redis, Memcached, Riak, Tokyo Cabinet, etc.}
  gem.description = %Q{kiki is a dead-simple module that you can include in your Models that provides convenient, DRY way of generating unique keys for your favorite K/V or NoSQL databases. }
  gem.email = "m@mattt.me"
  gem.authors = ["Mattt Thompson"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
