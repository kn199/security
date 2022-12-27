require 'rake'

namespace :env do
  desc "環境セットアップ"
  task :setup, ['docker_stop'] => :environment do |stop, arg|
    if (arg['docker_stop'] == "docker_stop")
      system("docker stop $(docker ps -q)")
    end

    system("mysql.server start")

    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    system("rails db:seed")
    system("rails s")
  end
end
