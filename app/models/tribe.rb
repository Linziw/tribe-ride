class Tribe < ApplicationRecord
  has_many :users, through: :user_tribes
  has_many :rides
  has_one_attached:image

  def thumbnail
    self.image.variant(resize: '300x300')
  end
end
