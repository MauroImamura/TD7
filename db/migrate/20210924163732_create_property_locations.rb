class CreatePropertyLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :property_locations do |t|
      t.string :title

      t.timestamps
    end
  end
end
