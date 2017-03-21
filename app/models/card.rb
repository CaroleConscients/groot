class Card < ApplicationRecord

  belongs_to :user, optional: true

  #Paperclip configuration
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :picture, attachment_presence: true

  def self.last_turned
    where(last_turned: true)
  end
end
