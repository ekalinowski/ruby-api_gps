class Place < ActiveRecord::Base
    scope :by_longitude, -> (min, max) { min && max ? where('longitude >= :min AND longitude <= :max', min: min, max: max) : all }
    scope :by_latitude, -> (min, max) { min && max ? where('latitude >= :min AND latitude <= :max', min: min, max: max) : all }
    scope :last_date, -> {where ('last = 1')}
    scope :vehicle_identifier, -> (vehicle_identifier) {vehicle_identifier ? where('last = 1 AND vehicle_identifier = :vehicle_identifier', vehicle_identifier: vehicle_identifier) : all}

    API_RESULTS_LIMIT = 100
      
    def self.search(min_lat:, max_lat:, min_lng:, max_lng:)
      by_latitude(min_lat, max_lat).by_longitude(min_lng, max_lng).last_date.limit(100)
    end

    class << self 
      def save_db(place_keys)
       place = Place.new(place_keys) 
       place.last = 1
       ex_place = vehicle_identifier(place.vehicle_identifier).first
       if (ex_place) 
        if place.sent_at >= ex_place.sent_at 
          then Place.update(ex_place.id, :last => 0) 
        else place.last = 0 
        end
       end
       place.save
      end   

    end 

  end
