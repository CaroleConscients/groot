class Card < ApplicationRecord

  belongs_to :user, optional: true

  #Paperclip configuration
  has_attached_file :picture, styles: { thumb: "20x23>" }, default_url: "/images/:style/missing.png"
  has_attached_file :color, styles: { thumb: "20x23>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :color, content_type: /\Aimage\/.*\z/

  validates :picture, attachment_presence: true
  validates :color, attachment_presence: true

  def self.last_turned
    where(last_turned: true)
  end
end
