class WithdrawsController < ApplicationController

    def index
    end


    def withdraw(account = 6891373, debit = 1)
        @customer = Customer.find_by!(account: account)
        id = @customer.id 
        @transaction = Transaction.find(id)
        if @transaction.opening_balance < debit
            redirect_to withdraws_path, :flash => {:error => "Insufficient funds."}
    else
        @transaction.opening_balance = @transaction.final_balance
        @transaction.debit = debit 
        @transaction.customer = @customer
        @transaction.final_balance = @transaction.opening_balance - @transaction.debit  
        @transaction.save
        render json: @customer, only: [:name, :account], include: {transactions: { only: [:opening_balance, :credit, :final_balance]}} 
      end
    end
end
