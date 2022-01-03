class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all

    render json: @customers, only: [:name, :birthdate, :account], root: true
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)  
    @transaction = Transaction.new(opening_balance: 0, credit:0, debit:0, final_balance:0)
    @customer[:account] = account_generator
    @customer[:password] = password_generator

    if @customer.save
      @transaction.customer = @customer
      @transaction.save
      render json: @customer, only: [:account, :password], status: :created, root: true, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end
  
  def account_generator
    n1 = rand(9)
    n2 = rand(9)
    n3 = rand(9)
    n4 = rand(9)
    n5 = rand(9)
    n6 = rand(9)
    n7 = rand(9)
    if n1 == 0
      n1 += 1
    end
    account = "#{n1}#{n2}#{n3}#{n4}#{n5}#{n6}#{n7}"
    account
  end
  
  def password_generator
    n1 = rand(9)
    n2 = rand(9)
    n3 = rand(9)
    n4 = rand(9)
    if n1 == 0
      n1 += 1
    end
    account = "#{n1}#{n2}#{n3}#{n4}"
    account
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :birthdate, :account, :password, :image)
    end
end
