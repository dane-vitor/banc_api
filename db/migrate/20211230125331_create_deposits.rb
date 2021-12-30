class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.integer :current_account
      t.float :deposit

      t.timestamps
    end
  end
end
