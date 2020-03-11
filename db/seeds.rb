# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["name", "email", "password", "admin", "peloton_name", "uid"],
  :users => [
    ["Gary Barlow", "gary@takethat.com", 0, "garybarlow", "FatGaz"],
    ["Robbie Williams", "robbie@takethat.com", 0,  "robbiewilliams", "Coulditbemagic"],
    ["Jason Orange", "jason@takethat.com", 0, "jasonorange", "Terryschocolate"],
    ["Mark Owen", "mark@takethat.com", 0, "markowen", "GreenMan"],
    ["Howard Donald", "howard@takethat.com", 0, "howarddonald", "Duckie"],
    ["Emma Bunton", "emma@spicegirls.com", 0, "emmabunton", "Babyspins"],
    ["Geri Halliwell", "geri@spicegirls.com", 0, "gerihalliwell", "Gingerwheely"],
    ["Melanie Chisholm", "melc@spicegirls.com", 0, "melaniechisholm", "SportySpinner"],
    ["Melanie Brown", "melb@spicegirls.com", 0, "melaniebrown", "ScaryPedals"]
    ["Victoria Adams", "vic@spicegirls.com", 0, "victoriaadams", "Tooposhtoopush"]
    ["Admin Demo", "admin@test.com", "Admin", 1, "Admintospin"]
  ],
  :tribe_keys =>
   ["name", "url", "owner_id"],
  :tribes => [
    ["UK Ladies Peloton", "https://www.facebook.com/groups/2232945666965776/"],
    ["PeloWinos (WineLovers)", "https://www.facebook.com/groups/311217199384064/"]
    ["Pelo Tortoises", "https://www.facebook.com/groups/2450992251657884/"]
    ],
}

def main
  make_users
  make_tribes
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_tribes
  DATA[:tribes].each do |tribe|
    new_tribe = Tribe.new
    tribe.each_with_index do |attribute, i|
      new_tribe.send(DATA[:tribe_keys][i]+"=", attribute)
    end
    new_tribe.save
  end
end


main
