module RidesHelper

  def number_of_riders(ride)
    ride.users.count
  end

  

end
