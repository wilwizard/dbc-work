class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  # def self.by_karma
  #   joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  # end

  def self.by_karma
    group('users.id').order('karma DESC')
  end

  def self.page(page_num, offset_val = 50)
    limit(offset_val).offset(page_num*offset_val)
  end

  def total_karma
    self.karma
  end

  def karma(value)
    value += read_attribute(:karma)
    write_attribute(:karma, value)
  end

  def karma
    read_attribute(:karma)
  end
  
  # def total_karma
  #   self.karma_points.sum(:value)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
end
