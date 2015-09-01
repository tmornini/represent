# -*- encoding : utf-8 -*-

task default: :test

desc 'run specs and lint'
task :test do
  begin
    # rubocop:disable all
    task('spec:unit').invoke
    task('lint').invoke
  rescue Exception => e
    raise e
    # rubocop:enable all
  end
end

desc 'start guard'
task :guard do
  sh 'bundle exec guard'
end

desc 'lint code'
task lint: 'lint:all'

desc 'rebase all branches atop master'
task rebase: 'git:rebase'
