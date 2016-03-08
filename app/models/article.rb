class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, { :class_name => "User" }
  has_many :photos
  has_many :edits
  has_many :editors, through: :edits

  def current_version
    self.edits.order(updated_at: :desc).first
  end

  def initial_version
    self.edits.order(created_at: :asc).first
  end


end
