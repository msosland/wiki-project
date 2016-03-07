class User < ActiveRecord::Base
  # include BCrypt
  has_secure_password

  has_many :articles, { :foreign_key => :author_id }
  has_many :edits, { :foreign_key => :editor_id }
  has_many :edited_articles, { :through => :edits, :source => :articles }

  validates :username, presence: true, uniqueness: true

  has_attached_file :image, :styles => {:small => "50x50", :large => "150x150"}

  validates_attachment :image, :content_type => {:content_type => /^image\/(jpeg|png|gif|tiff)$/ }


end
