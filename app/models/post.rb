class Post < ActiveRecord::Base
  VALID_URL_REGEX = /(\S+\.(com|net|org|edu|gov)(\/\S+)?)/
  validates :link, presence: true, format: VALID_URL_REGEX
  
  validates :descriptive_text, presence: true
end
