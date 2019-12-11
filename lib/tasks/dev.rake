namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
  
   User.destroy_all

 a = User.new
 a.email = "a@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = true
 a.save

a = User.new
 a.email = "b@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = true  
 a.save


 a = User.new
 a.email = "c@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = true
 a.save


 a = User.new
 a.email = "d@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


 a = User.new
 a.email = "e@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


  a = User.new
 a.email = "f@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


  a = User.new
 a.email = "g@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


  a = User.new
 a.email = "h@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


 a = User.new
 a.email = "i@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


 a = User.new
 a.email = "j@example.com"
 a.name = Faker::Name.name
 a.password = "password"
 a.provider = false
 a.save


  end

end
