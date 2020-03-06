class User < ApplicationRecord
  has_secure_password
  has_many :user_rides, dependent: :destroy
  has_many :user_tribes, dependent: :destroy
  has_many :tribes, through: :user_tribes
  has_many :rides, through: :user_rides
  accepts_nested_attributes_for :user_tribes

  def participating?(ride)
    if self.rides.ids.include?(ride.id)
      true
    else
     false
    end
  end

  def member_and_participating
    self.rides.select {|r| self.tribes.include?(r.tribe)}
  end

  def milestone_present?(ride)
    r = self.user_rides.find_by(ride_id: ride.id)
    true if r.milestone != "" && r.milestone != nil
  end

  def display_milestone(ride)
    self.user_rides.find_by(ride_id: ride.id).milestone
  end

end
