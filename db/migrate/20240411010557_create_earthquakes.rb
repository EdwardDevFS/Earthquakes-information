class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.string :external_id, uniqueness: true
      t.decimal :magnitude
      t.string :place, null: false
      t.text :url, null: false
      t.string :time
      t.boolean :tsunami
      t.string :mag_type, null:false
      t.string :title, null:false
      t.decimal :longitude, null:false
      t.decimal :latitude, null:false

      t.timestamps
    end
  end
end
