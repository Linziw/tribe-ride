module RidesHelper
  def number_of_riders(ride)
    ride.users.count
  end

  def instructors
    ["Alex Toussant", "Ally Love", "Ben Alldis", "Christine D'Ercole", "Cody Rigsby", "Denis Morton", "Emma Lovewell", "Erik Jager", "Hannah Marie Corbin", "Hannah Frankson", "Irene Scholz", "Jenn Sherman", "Jess King", "Kendall Toole", "Leanne Hainsby", "Matt Wilpers",
     "Olivia Amato", "Robin Arzon", "Sam Yo", "Tunde Oyeneyin"]
  end

  def display_date(date)
    date.strftime("%A %d %B")
    #{ride.original_time.strftime('%I:%M %p')"
  end

  def display_time(time)
    time.strftime("%I:%M %p")
  end

  def display_ride(ride)
    "#{display_date(ride.date)} -  #{ride.instructor} -  #{display_time(ride.time)} #{ride.format} -  #{ride.duration} mins"
  end

  def display_original(ride)
    "#{display_date(ride.original_date)} at #{display_time(ride.original_time)}"
  end
end
