require 'bundler'
require "rdoc/task"
require "rake/testtask"

Bundler::GemHelper.install_tasks

task :default => :test

RDoc::Task.new do |rd|
  rd.rdoc_dir = "rdoc"
  rd.rdoc_files.include("lib/**/*.rb")
end

Rake::TestTask.new(:test)
