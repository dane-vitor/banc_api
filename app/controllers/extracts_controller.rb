class ExtractsController < ApplicationController
  before_action :set_extract, only: [:show, :update, :destroy]

  # GET /extracts
  def index
    @extracts = Extract.all
    render json: @extracts, only: [:current_account, :opening_balance, :credit, :debit, :final_balance], root: true
  end

  # GET /extracts/1
  def show
    render json: @extract
  end

  # POST /extracts
  def create
    set_extract
    @extract = Extract.where(current_account: @extract.current_account)
    render json: @extract, only: [:created_at, :current_account, :opening_balance, :credit, :debit, :final_balance], root: true   
  end

  # PATCH/PUT /extracts/1
  def update
    if @extract.update(extract_params)
      render json: @extract
    else
      render json: @extract.errors, status: :unprocessable_entity
    end
  end

  # DELETE /extracts/1
  def destroy
    @extract.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extract
      @extract = Extract.find_by!(extract_params)
    end

    # Only allow a list of trusted parameters through.
    def extract_params
      params.require(:extract).permit(:current_account, :opening_balance, :credit, :debit, :final_balance)
    end
end
