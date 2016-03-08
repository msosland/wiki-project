class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, { :class_name => "User" }
  has_many :photos
  has_many :versions
  has_many :editors, through: :versions
  attr_accessor :title

  validates :title, presence: true

  def current_version_content
    self.versions.last.content.html_safe
  end

  def initial_version
    self.versions.order(created_at: :asc).first
  end

  def self.search(query)
    where("title like ?", "%#{query}%").order("created_at DESC")
  end



end
