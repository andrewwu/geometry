class ChangeDataTypesInSizes < ActiveRecord::Migration
  def change
    [:top_tube, :head_tube, :seat_tube, :bottom_bracket_drop, :front_center,
     :chainstay, :fork_rake, :trail, :wheelbase, :standover,
     :stack, :reach].each do |attribute|
      change_column :sizes, attribute, :float
    end
  end
end
