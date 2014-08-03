class CreateModelsSizesJoinTable < ActiveRecord::Migration
  def change
    create_table :models_sizes, id: false do |t|
      t.integer :model_id
      t.integer :size_id
    end
    add_index :models_sizes, :model_id
    add_index :models_sizes, :size_id
    add_index :models_sizes, [:model_id, :size_id], unique: true
  end
end
