class Vote < ActiveRecord::Base
  attr_accessible :value, :votable_id, :votable_type, :user_id

  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:votable_type, :votable_id] }

end
