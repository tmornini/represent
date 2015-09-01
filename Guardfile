# -*- encoding : utf-8 -*-

clearing :on

require 'guard/compat/plugin'

# rubocop:disable Style/ClassAndModuleChildren

module ::Guard
  class Subledger < Plugin
    def initialize _options_ = { }
      super
    end

    def start
      run_all
      true
    end

    def stop
      true
    end

    def reload
      exec 'bundle exec rake guard'
    end

    def run_all
      throw_on_failed_tests { system 'rake' }
    end

    def run_on_additions _pathnames_
      true
    end

    def run_on_modifications pathnames
      pathnames.each do |pathname|
        throw_on_failed_tests do
          handle pathname
        end
      end

      true
    end

    def run_on_removals _pathnames_
      run_all
    end

    private

    def throw_on_failed_tests
      throw :task_has_failed unless yield
      true
    end

    def spec_prefix_for pathname
      pathname
        .match(
          %r{^(lib/(.+/)?[^/]+)[.](rb|spec)$}
        )[1]
    end

    def spec_pathname_for pathname
      return pathname if pathname =~ /[.]spec$/
      spec_prefix_for(pathname) + '.spec'
    end

    def not_applicable? pathname
      pathname =~ /spec_helper/
    end

    def handle pathname
      return if not_applicable? pathname

      handle_unit_spec_for pathname
      handle_integration_spec_for pathname
      handle_lint_for pathname
    end

    def handle_unit_spec_for pathname
      spec_pathname = spec_pathname_for pathname

      if File.exist? spec_pathname
        system "bundle exec rake spec:unit TEST=#{spec_pathname}"
      else
        puts "#{pathname} is missing spec #{spec_pathname}"
      end
    end

    def handle_integration_spec_for pathname
      return unless pathname =~ /^spec/

      system 'bundle exec rake spec:integration ' \
             "TEST=#{spec_pathname_for pathname}"
    end

    def handle_lint_for pathname
      system "bundle exec rake lint:file TEST=#{pathname}"
    end
  end
end

guard :subledger do
  watch 'Gemfile' do
    system 'bundle update'

    nil
  end

  watch %r{(lib|spec)/(.+)[.](rb|spec)$}
end
