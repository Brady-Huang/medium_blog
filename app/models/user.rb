class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: {
    user: 0,
    vip_user: 1,
    platinum_user: 2,
    admin: 3
  }
  ## relationships
  has_many :stories
  has_many :follows
  has_many :bookmarks
  has_one_attached :avatar
  ## validation
  validates :username, presence: true, uniqueness: true

  ## instance method
  def paid_user?
    vip_user? or platinum_user?
  end

  def follow?(user)
    # follows.where(following: user) ## return array comsume more memory
    follows.exists?(following: user) # true/ false 
  end

  def follow!(user)
    if follow?(user)
      follows.find_by(following: user).destroy
      return 'Follow'
    else
      follows.create(following: user)
      return 'Followed'
    end
  end

  def bookmark?(story)
    bookmarks.exists?(story: story) # true/ false 
  end

  def bookmark!(story)
    if bookmark?(story)
      bookmarks.find_by(story: story).destroy
      return "Unbookmarked"
    else
      bookmarks.create(story: story)
      return 'Bookmarked'
    end
  end
end
