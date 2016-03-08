# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




100.times do |i|
	Center.create(refugees_number: rand(10000), description: Faker::Lorem.sentence, address: Faker::Address.street_address, name: Faker::Name.name, 
		phone_number: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, contact_email: Faker::Internet.email,
		latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, password: Faker::Internet.password, center_type: rand(3)+1)
end


Need.create(name: "Τρόφιμα")
Need.create(name: "Ρούχα")
Need.create(name: "Φάρμακα")
Need.create(name: "Άνθρωποι")


100.times do |i|
	CenterNeed.create(center_id: i+1, need_id: 1, importance: rand(3), description: Faker::Lorem.sentence)
	CenterNeed.create(center_id: i+1, need_id: 2, importance: rand(3), description: Faker::Lorem.sentence)
	CenterNeed.create(center_id: i+1, need_id: 3, importance: rand(3), description: Faker::Lorem.sentence)
	CenterNeed.create(center_id: i+1, need_id: 4, importance: rand(3), description: Faker::Lorem.sentence)
end

100.times do |i|
	Keyword.create(keyword: Faker::Lorem.word)
end

100.times do |i|
	CenterKeyword.create(center_id: i+1, keyword_id: rand(100)+1)
	CenterKeyword.create(center_id: i+1, keyword_id: rand(100)+1)
	CenterKeyword.create(center_id: i+1, keyword_id: rand(100)+1)
	CenterKeyword.create(center_id: i+1, keyword_id: rand(100)+1)
end
