class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :update, :destroy]

  # GET /deposits
  def index
    @deposits = Deposit.all

    render json: @deposits
  end

  # GET /deposits/1
  def show
    render json: @deposit
  end

  # POST /deposits
  def create
    set_deposit
    @customer = Customer.find_by!(account: @deposit.current_account)
    id = @customer.id 
    @transaction = Transaction.find(id)
    @transaction.opening_balance = @transaction.final_balance
    @transaction.credit = @deposit.deposit 
    @transaction.customer = @customer  
    @transaction.final_balance = @transaction.opening_balance + @transaction.credit
    @transaction.save
    @deposit.destroy
    render json: @customer, only: [:name, :account], include: {transactions: { only: [:opening_balance, :credit, :final_balance]}} 
  end

  # PATCH/PUT /deposits/1
  def update
    if @deposit.update(deposit_params)
      render json: @deposit
    else
      render json: @deposit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deposits/1
  def destroy
    @deposit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Deposit.create(deposit_params)
    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.require(:deposit).permit(:current_account, :deposit)
    end
end
