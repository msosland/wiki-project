class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, { :class_name => "User" }
  has_many :photos
  has_many :versions
  has_many :editors, through: :versions

  def current_version
    self.versions.order(updated_at: :desc).first
  end

  def initial_version
    self.versions.order(created_at: :asc).first
  end

  def self.search(query)
    where("title like ?", "%#{query}%").order("created_at DESC")
  end



end
