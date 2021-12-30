class CreateExtracts < ActiveRecord::Migration[6.1]
  def change
    create_table :extracts do |t|
      t.integer :current_account
      t.float :opening_balance
      t.float :credit
      t.float :debit
      t.float :final_balance

      t.timestamps
    end
  end
end
