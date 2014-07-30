class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.float :frame_size
      t.integer :top_tube
      t.integer :head_tube
      t.float :head_tube_angle
      t.integer :seat_tube
      t.float :seat_tube_angle
      t.integer :bottom_bracket_drop
      t.integer :front_center
      t.integer :chainstay
      t.integer :fork_rake
      t.integer :trail
      t.integer :wheelbase
      t.integer :standover
      t.integer :stack
      t.integer :reach

      t.timestamps
    end
  end
end
