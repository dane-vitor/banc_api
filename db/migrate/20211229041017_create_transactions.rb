class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :opening_balance
      t.float :credit
      t.float :debit
      t.float :final_balance
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
