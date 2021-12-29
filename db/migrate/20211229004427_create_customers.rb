class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birthdate
      t.integer :account
      t.integer :password

      t.timestamps
    end
  end
end
