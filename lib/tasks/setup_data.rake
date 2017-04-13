
task :setup_data  => :environment do
  50.times do
    store = Store.new
    store.name = Faker::Company.name
    store.street = Faker::Address.street_address
    store.city = ["New York city","Chicago"].sample
    store.zip = Faker::Address.zip_code
    store.phone = Faker::PhoneNumber.cell_phone
    store.website = (store.name).downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '').concat(".com").prepend("www.")
    store.save
  end
end
