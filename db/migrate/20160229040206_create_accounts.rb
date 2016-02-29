class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.timestamps
    end
  end
end
