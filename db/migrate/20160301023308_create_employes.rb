class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.string :name
      t.integer :year
      t.integer :department_id
      t.string :role
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
