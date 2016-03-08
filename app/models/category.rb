class Category < ActiveRecord::Base
  has_many :articles

  validates :title, presence: true, uniqueness: true

  def has_articles
    self.articles.count > 0
  end

end
