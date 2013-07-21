class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :proficiencies
  has_many :skills, :through => :proficiencies

  def proficiency_for(skill)
    skill.proficiencies.where(:user_id => self.id).first.score
  end

  def set_proficiency_for(skill, number)
    proficiency = skill.proficiencies.where(:user_id => self.id).first
    proficiency.score = number
    proficiency.save
  end
end
