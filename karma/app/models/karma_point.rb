class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true


  after_save :update_user_karma 


  private
  def update_user_karma
    user = self.user
    value = self.value
    user_karma = user.read_attribute(:karma)
    user_karma += value
    user.update_attribute(:karma, user_karma)
  end
end
