class Ride < ApplicationRecord
  has_many :user_rides, dependent: :destroy
  belongs_to :tribe, optional: true
  has_many :users, through: :user_rides
  validates :instructor, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :format, presence: true

  scope :upcoming, -> { Ride.where("date > ?", DateTime.now) }

  private

  def self.ride_creator(params)
    tribe = Tribe.find(params[:tribe_id])
    user = User.find(tribe.owner_id)
    ride = tribe.rides.build(params)
  end

  
end
