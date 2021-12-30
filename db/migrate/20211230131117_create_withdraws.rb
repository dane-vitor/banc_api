class CreateWithdraws < ActiveRecord::Migration[6.1]
  def change
    create_table :withdraws do |t|
      t.integer :current_account
      t.float :withdraw

      t.timestamps
    end
  end
end
