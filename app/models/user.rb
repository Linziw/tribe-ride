class User < ApplicationRecord
  has_many :tribes, through: :user_tribes
  has_many :rides, through: :user_rides
end
