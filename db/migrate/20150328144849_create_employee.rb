class CreateEmployee < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :number
      t.integer :salary
      t.integer :organization_id

      t.timestamps

      #add_index :employees, :organization_id
    end

    add_index :employees, [:organization_id]
  end
end
