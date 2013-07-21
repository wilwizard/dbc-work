class Event < ActiveRecord::Base
  validates :organizer_email, format: { with: /\S+@\S+.(com|net|gov)/, message: "must be a valid email"}
  validates :title, uniqueness: { message: "Title is already taken" }
  validates :organizer_name, presence: { message: "Must include name" }
  validates :date, presence: { message: "Must include date" }
  validate :date_is_in_the_past

  def date_is_in_the_past
    if date.present? and date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end


end
 