class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, { :class_name => "User" }
  has_many :photos
  has_many :edits
  has_many :editors, through: :edits

end
