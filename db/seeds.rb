# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Country, State And Cities

# Creates Country
CS.countries.each do |c_code, c_name|
  Country.create(name: c_name, short_code: c_code)
end
country_id = Country.where(short_code: "IN").pluck(:id).last
#Creates All Indian States
CS.states(:IN).each do |s_code, s_name|
	State.create(name: s_name, short_code: s_code, country_id: country_id)
end
state_id  = State.where(short_code: 'KA').pluck(:id).last
#Creates All States of Karnataka
CS.cities(:KA, :IN).each do |city_name|
  City.create(name: city_name, country_id: country_id, state_id: state_id)
end

city_id = City.where(name: 'Bangalore').pluck(:id).last
state_id = State.where(short_code: 'KA').pluck(:id).last
country_id = Country.where(name: 'India').pluck(:id).last
# Create Default places
Place.create!(name: 'Dmart', address: 'Bommasandra', latitude: 12.8184, longitude: 77.6900, place_type: 'Shopping Mall', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Omkar', address: 'Bommasandra', latitude: 12.8168, longitude: 77.6989 ,place_type: 'Appartments', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'KFC Hebbagodi', address: 'Hebbagodi', latitude: 12.8257, longitude: 77.6780 ,place_type: 'Restaurant', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'SBI', address: 'Electronic city', latitude: 12.8399, longitude: 77.6770,place_type: 'Bank', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Brand Factory', address: 'Bommanahalli', latitude: 12.899162, longitude: 77.616859, place_type: 'Shopping Mall', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Prashant Hospital', address: 'Bommanahalli', latitude: 12.899162, longitude: 77.616859, place_type: 'Hospital', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Forum', address: 'Koramangala', latitude:12.934533, longitude: 77.626579, place_type: 'Shopping Mall', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Big Bazaar', address: 'Koramangala', latitude: 12.9279, longitude: 77.6271, place_type: 'Shopping Mall', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Lalbagh', address: 'Wilson garden', latitude: 12.9507, longitude: 77.5848, place_type: 'Hangouts', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Nandi Hills', address: 'Chikkaballapur', latitude: 12.972442, longitude: 77.580643, place_type: 'Hangouts', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Bannerghatta National Park', address: 'Bannerghatta', latitude:12.8003, longitude: 77.5770, place_type: 'Hangouts', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'CubbonPark', address: 'Kasturba Road', latitude: 12.9763, longitude: 77.5929, place_type: 'Hangouts', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Iskcon', address: 'Rajajinagar', latitude: 13.0098, longitude: 77.5511,place_type: 'Temple', city_id: city_id, state_id: state_id, country_id: country_id)
Place.create!(name: 'Wonderla', address: 'Mysore Road', latitude: 12.8346, longitude: 77.4010, place_type: 'Shopping Mall', city_id: city_id, state_id: state_id, country_id: country_id)