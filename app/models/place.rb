class Place < ApplicationRecord
	acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

   belongs_to :country
   belongs_to :state
   belongs_to :city

  def self.get_nearby_places(latitude, longitude, units, distance)
  	places_hash = {}
  	places_hash["response"] ||= {}
  	places = Place.includes(:city, :state, :country).within(distance.to_f, :units => units.to_sym, :origin => [latitude, longitude])
  	if places.present?
  		places.each do |place|
  			places_hash["response"]["#{place.name}"] = {'Place name' => place.name, "Place Type" => place.place_type, "Latitude" => place.latitude, "Longitude" => place.longitude, "Location" => place.address, "City" => place.city.name, "State" => place.state.name, "Country" => place.country.name}
  		end
  	else
  		places_hash["response"] = "No places found near to the given latitude and longitude"
  	end
  	places_hash
  end

end
