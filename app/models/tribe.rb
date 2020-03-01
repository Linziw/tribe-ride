class Tribe < ApplicationRecord
  has_many :user_tribes
  has_many :users, through: :user_tribes
  has_many :rides
  has_one_attached:image

  def thumbnail
    self.image.variant(resize: '300x300')
  end

  def main_image
    self.image.variant(resize: '600x600')
  end
end
