class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, { :class_name => "User" }
  has_many :photos
  has_many :versions
  has_many :editors, through: :versions

  validates :title, presence: true

  def current_version_content
    self.versions.last.content.html_safe
  end

  def initial_version
    self.versions.order(created_at: :asc).first
  end

  def self.find_featured
    Article.find_by(featured:true)
  end

  def remove_featured_status
    self.update(featured: false)
  end

  def make_featured_status
    self.update(featured: true)
  end

  def unpublish_article
    self.update(status: 'unpublished')
  end

  def publish_article
    self.update(status: 'published')
  end

  def mark_as_needs_sources
    self.update(needs_sources: true)
  end

  def remove_needs_sources
    self.update(needs_sources: false)
  end


  def self.search(query)
    self.joins(:versions).where("LOWER(versions.content) like ?", "%#{query.downcase}%")

  end

  def first_picture
    self.versions.last.content.match(/\<img.*?\/\>/).to_a[0]
  end

  def longest_sentence
    self.versions.last.content.scan(/\w[a-z\s]+\w/).to_a.sort_by!{|word| word.length}[-1]
  end


end
