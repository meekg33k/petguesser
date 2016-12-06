class RemoveBmiFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :bmi, :float
  end
end
