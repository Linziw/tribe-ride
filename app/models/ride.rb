class Ride < ApplicationRecord
  belongs_to :tribe
  has_many :users, through: :user_rides
end
