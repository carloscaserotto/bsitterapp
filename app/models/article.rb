class Article < ApplicationRecord
  has_one_attached :header_image   # Use has_one_attached for only one file allowed
  has_many_attached :uploads   # Use has_one_attached for only one file allowed
  #belongs_to :user
  
  
end