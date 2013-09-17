class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :location
      t.string :zipcode
      t.string :slug
      t.timestamps
    end
    add_index :cities, :slug
  end
end
