class Version < ActiveRecord::Base
  belongs_to :editor, { :class_name => "User" }
  belongs_to :article

  validates :content, presence: true

end
