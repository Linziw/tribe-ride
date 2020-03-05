class Tribe < ApplicationRecord
  has_many :user_tribes, dependent: :destroy
  has_many :users, through: :user_tribes
  has_many :rides, dependent: :destroy
  has_one_attached:image, dependent: :destroy

  def thumbnail
    self.image.variant(resize: '300x300')
  end

  def main_image
    self.image.variant(resize: '600x600')
  end

  def owner?(user)
    self.owner_id == user.id
  end
end
