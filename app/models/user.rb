class User < ApplicationRecord
  has_secure_password
  has_many :user_rides
  has_many :user_tribes
  has_many :tribes, through: :user_tribes
  has_many :rides, through: :user_rides

  def participating?(ride)
    if self.rides.ids.include?(ride.id)
      true
    else
     false
    end
  end

end
