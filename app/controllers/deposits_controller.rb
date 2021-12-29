class DepositsController < ApplicationController


    def deposit(account = 6891373, credit = 1)
        @customer = Customer.find_by!(account: account)
        id = @customer.id 
        @transaction = Transaction.find(id)
        @transaction.opening_balance = @transaction.final_balance
        @transaction.credit = credit 
        @transaction.customer = @customer  
        @transaction.final_balance = @transaction.opening_balance + @transaction.credit
        @transaction.save
        render json: @customer, only: [:name, :account], include: {transactions: { only: [:opening_balance, :credit, :final_balance]}} 
      end

end
