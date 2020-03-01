class Ride < ApplicationRecord
  has_many :user_rides, dependent: :destroy
  belongs_to :tribe
  has_many :users, through: :user_rides

end
