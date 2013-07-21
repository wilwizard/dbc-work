class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :commentvotes

  def vote_count
    count = 0

    self.commentvotes.each do |vote| 
      if vote.is_up
        count += 1
      else
        count -= 1
      end
    end
    count
  end
end

