class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: [:show, :update, :destroy]

  # GET /withdraws
  def index
    @withdraws = Withdraw.all

    render json: @withdraws
  end

  # GET /withdraws/1
  def show
    render json: @withdraw
  end

  # POST /withdraws
  def create
    set_withdraw
    @customer = Customer.find_by!(account: @withdraw.current_account)
    id = @customer.id 
    @transaction = Transaction.find(id)
    if @transaction.opening_balance < @withdraw.withdraw
        redirect_to withdraws_path, :flash => {:error => "Insufficient funds."}
else
    @transaction.opening_balance = @transaction.final_balance
    @transaction.debit = @withdraw.withdraw
    @transaction.customer = @customer
    @transaction.final_balance = @transaction.opening_balance - @transaction.debit  
    @transaction.save
    @withdraw.destroy
    render json: @customer, only: [:name, :account], include: {transactions: { only: [:opening_balance, :debit, :final_balance]}} 
  end
  end

  # PATCH/PUT /withdraws/1
  def update
    if @withdraw.update(withdraw_params)
      render json: @withdraw
    else
      render json: @withdraw.errors, status: :unprocessable_entity
    end
  end

  # DELETE /withdraws/1
  def destroy
    @withdraw.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw
      @withdraw = Withdraw.create(withdraw_params)
    end

    # Only allow a list of trusted parameters through.
    def withdraw_params
      params.require(:withdraw).permit(:current_account, :withdraw)
    end
end
