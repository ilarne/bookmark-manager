require 'data_mapper'
require './app/app'

namespace :db do
  desc 'Upgrade' do
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto-upgrade complete. No existing data destroyed."
    end

    desc 'Migrate' do
      task :auto_migrate do
        DataMapper.auto_migrate!
        puts "Auto-migrate complete. Existing data destroyed."
      end
    end
end
