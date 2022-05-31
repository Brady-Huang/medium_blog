class Comment < ApplicationRecord
  acts_as_paranoid
  # relationships
  belongs_to :user
  belongs_to :story
  
  # validations
  validates :content, presence: true

end
