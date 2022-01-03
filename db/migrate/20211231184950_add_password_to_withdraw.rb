class AddPasswordToWithdraw < ActiveRecord::Migration[6.1]
  def change
    add_column :withdraws, :password, :integer
  end
end
