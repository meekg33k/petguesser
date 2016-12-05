class AddPetToPerson < ActiveRecord::Migration
  def change
    add_column :people, :pet, :string
  end
end
