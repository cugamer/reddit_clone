class Post < ActiveRecord::Base
  belongs_to :user
  
  VALID_URL_REGEX = /(\S+\.(com|net|org|edu|gov)(\/\S+)?)/
  validates :link, presence: true, format: VALID_URL_REGEX
  
  validates :descriptive_text, presence: true
  
  after_initialize :set_default_values
  
  def set_default_values
    self.rating = 0
  end
end
