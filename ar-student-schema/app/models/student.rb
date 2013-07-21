require_relative '../../db/config'
require 'date'

# implement your Student model here

class Student < ActiveRecord::Base

  validates :email, :format => { :with => /\w+@.+\.\w{2,}/, :message => "Invalid Email WRONG!!!"}
  validates :phone, :format => { :with => /\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d.*\d/, :message => "Invalid Email WRONG!!!"}
  validates :email, :uniqueness => true
  validate :age_verify
  
  def age_verify
    if age < 5
      errors.add(:age, "can't be too young")
    end
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    ((Date.today - birthday)/(365.25)).to_i
  end
end
