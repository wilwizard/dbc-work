class Vote < ActiveRecord::Base
  attr_accessible :user_id, :voteable_id, :voteable_type
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :user_id, :presence => true

end
