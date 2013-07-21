class Skill < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, :uniqueness => true

  has_many :proficiencies
  has_many :users, :through => :proficiencies

  def user_with_proficiency(number)
    # self.users.each do |user|
    #   if user.proficiency_for(self) == number
    #     return user
    #   end
    # end

    self.proficiencies.where(:score => number).sample.user



  end

end
