ActiveRecord::Base.logger = nil

User.all.each do |user|
  value = KarmaPoint.where(user_id: user.id).pluck('value').inject(:+)
  user.update_attribute(:karma, value)
end

