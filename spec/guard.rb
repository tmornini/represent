require 'guard/plugin'

module Guard
  class Subledger < Guard::Plugin
    def run_all
      system 'clear; bundle exec rake'
    end
  end
end
