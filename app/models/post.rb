class Post < ApplicationRecord
  validates :title, 
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: {min: 3, maximum: 252} 
  validates :content,
    presence: true,
    length: { minimum: 7, maximum: 10000 }
end
