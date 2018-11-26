require 'test_helper'

class PlacesControllerTest < ActionController::TestCase

  setup do
    @one = places(:one)
    @two = places(:two)
    @three = places(:three)
  end

  test "GET places" do
    get :index, min_lat: 10, max_lat: 20, min_lng: 10, max_lng: 20
    assert_response 200
  end

  test "POST place" do
    post :save_place, params: {
      "latitude": -33.23,
      "longitude": -69.56,
      "sent_at": "2016-06-03 20:45:00",
      "vehicle_identifier": "TEST"
    }
    assert_response 200
  end

  test "Verificar que el lugar se guarde en la bd" do
    assert_equal true, @one.save
  end

  test "GET places solo trae ultima ubicacion" do
    @one.save
    @two.save
    @three.save

    get :index, min_lat: 10, max_lat: 20, min_lng: 10, max_lng: 20
    @body = @response.body
    assert_equal 2, @body.length
  end

  test "GET places llama al metodo correcto" do
    @one.save
    @two.save
    @three.save
    get :index, min_lat: 10, max_lat: 20, min_lng: 10, max_lng: 20
    @body = @response.body
    assert_equal "index", @controller.action_name
  end

end
