class Card < ApplicationRecord

  belongs_to :user, optional: true
  validates :picture_link, presence: true

  def self.last_turned
    where(last_turned: true)
  end
end
