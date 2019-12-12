namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
  
  Calendar.destroy_all

 c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

 c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save

  c = Calendar.new
 c.description = Faker::Quote.matz
 c.save


  end

end
