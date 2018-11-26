require 'test_helper'

class PlaceTest < ActiveSupport::TestCase

  setup do
    @one = places(:one)
    @two = places(:two)
    @three = places(:three)
  end

  test "verificacion de identificador de vehiculo" do
      assert_equal "LPA-076", @one.vehicle_identifier
  end

  test "al guardar un lugar se le asigna un id" do
    @one.save
    assert_not_nil @one.id
  end

end
