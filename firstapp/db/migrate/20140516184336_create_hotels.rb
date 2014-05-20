class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :country

      t.timestamps
    end
  end
end
