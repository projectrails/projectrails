class CreateDateRooms < ActiveRecord::Migration
  def change
    create_table :date_rooms do |t|
      t.string :reserve_user
      t.date :busy_end
      t.date :busy_start
      t.integer :room_id_id

      t.timestamps
    end
  end
end
