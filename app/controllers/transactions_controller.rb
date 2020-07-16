class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]
  CATEGORIES = ["Food and Drinks", "Shopping", "Services", "Transport", "Income", "Others"]
  # to-do: enum 

  def show
    render json: @transaction
  end

  def create
    @account = current_user.accounts.find(params[:account_id])
    @transaction = @account.transactions.new(transaction_params)
    # TO-DO: chequear join
    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.fetch(:transaction, {}).permit(:date,:payee,:category,:description,:amount)
    end
end