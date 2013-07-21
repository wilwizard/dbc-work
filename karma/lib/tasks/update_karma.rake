ActiveRecord::Base.logger = nil

namespace :db do
  desc "update karma field in users table"
  task :update_karma => :environment do
    User.all.each do |user|
      value = KarmaPoint.where(user_id: user.id).pluck('value').inject(:+)
      user.update_attribute(:karma, value)
      puts "userid: #{user.id}" if user.id % 1000 == 0
    end

  end
end 

