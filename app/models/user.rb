class User < ActiveRecord::Base
  has_many :articles, { :foreign_key => :author_id }
  has_many :edits, { :foreign_key => :editor_id }
  has_many :edited_articles, { :through => :edits, :source => :articles }

  has_attached_file :image, :styles => {:small => "75x75", :large => "300x300"}

  # validates_attachment :image, :content_type => {:content_type => }

end
