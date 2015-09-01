# -*- encoding : utf-8 -*-

namespace :lint do
  task :all do
    sh 'bundle exec rubocop --fail-fast --display-cop-names'
  end

  desc 'lint a single file: TEST=pathname'
  task :file do
    sh "bundle exec rubocop --display-cop-names #{ENV['TEST']}"
  end

  task :ci do
    sh 'bundle exec rubocop --display-cop-names'
  end
end
