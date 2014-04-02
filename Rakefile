require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

begin
  require 'cane/rake_task'

  desc 'Run cane to check quality metrics'
  Cane::RakeTask.new(:quality) do |cane|
    cane.add_threshold 'coverage/.last_run.json', :>=, 99
    cane.abc_glob = '{lib}/**/*.rb'
    cane.abc_max = 15
    cane.style_measure = 100
    cane.style_exclude = %w[spec/spec_helper.rb]
    cane.canefile = '.cane'
  end
rescue LoadError
end

namespace :doc do
  begin
    require 'yard'

    YARD::Rake::YardocTask.new do |task|
      task.files   = ['README.md', 'LICENSE.md', 'lib/**/*.rb']
      task.options = [
        '--output-dir', 'doc/yard',
        '--markup', 'markdown'
      ]
    end
  rescue LoadError
  end
end

Rake::Task[:spec].enhance do
  Rake::Task[:quality].invoke
end

task :test => :spec
task :default => :spec
