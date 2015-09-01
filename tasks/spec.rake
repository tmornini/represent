# -*- encoding : utf-8 -*-

require 'rake/testtask'

require './spec/_helpers'

namespace :spec do
  Rake::TestTask.new :unit do |task|
    task.loader     = 'file://spec/loader'
    task.test_files = FileList['lib/**/*.spec']
  end
end
