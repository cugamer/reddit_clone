class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :post_id, presence: true
  validates :comment_text, presence: true
end
