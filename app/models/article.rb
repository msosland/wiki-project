class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :photos
  has_many :edits
  has_many

end
