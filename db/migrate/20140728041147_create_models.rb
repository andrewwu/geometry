class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :year
      t.string :name

      t.timestamps
    end
  end
end
