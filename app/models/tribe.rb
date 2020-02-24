class Tribe < ApplicationRecord
  has_many :users, through: :user_tribes
  has_many :rides
end
