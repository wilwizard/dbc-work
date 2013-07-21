class Post < ActiveRecord::Base
  has_many :comments
  has_many :postvotes
  belongs_to :user

  def vote_count
    count = 0

    self.postvotes.each do |vote| 
      if vote.is_up
        count += 1
      else
        count -= 1
      end
    end
    count
  end


end
