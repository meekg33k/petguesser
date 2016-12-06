class AddBmiToPerson < ActiveRecord::Migration
  def change
    add_column :people, :bmi, :float
  end
end
