class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :myreview
      t.string :myreview_user
      t.date :myreview_date
      t.integer :myreview_id

      t.timestamps
    end
  end
end
