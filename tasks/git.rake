# -*- encoding : utf-8 -*-

namespace :git do
  task :rebase do
    branches = `git branch`.split "\n"

    current_branch = branches.select { |branch| branch[0] == '*' }

    current_branch = current_branch.first[2..-1]

    non_master_branches =
      branches.reject { |branch| branch[2..-1] == 'master' }

    non_master_branches.map! { |branch| branch[2..-1] }

    non_master_branches.each do |branch|
      sh "git checkout #{branch}; git rebase master"
    end

    sh "git checkout #{current_branch}"
  end
end
