class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.string :sent_at
      t.string :vehicle_identifier, null: false
      t.string:last

      t.timestamps
    end
  end
end
