class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_type
      t.integer :room_price
      t.string :room_desc
      t.integer :hotel_id_id

      t.timestamps
    end
  end
end
