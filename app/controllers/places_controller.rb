class PlacesController < ApplicationController
  def index
    places = Place.search(search_params.to_h.symbolize_keys)
    render json: places
  end
  
  def save_place
    Place.delay.save_db(place_params.to_h.symbolize_keys)
    render text: "Success"
  end



  private
 
  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat)
  end

  def place_params
    params.permit(:latitude, :longitude, :sent_at,:vehicle_identifier)
  end


end