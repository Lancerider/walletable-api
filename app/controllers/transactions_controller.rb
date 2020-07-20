# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show update destroy]

  def index
    if params[:account_id]
      @account = current_user.accounts.find(params[:account_id])
      @transactions = @account.transactions
    else
      @transactions = current_user.transactions.order(date: :desc)
    end

    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @account = if params[:account_id]
                 current_user.accounts.find_by(id: params[:account_id])
               else
                 current_user.accounts.first
               end

    if @account
      @transaction = @account.transactions.new(transaction_params)
      if @transaction.save
        render json: @transaction, status: :created, location: @transaction
      else
        render json: { error: @transaction.errors.full_messages.join(',') }, status: :unprocessable_entity
      end
    else
      render json: { error: 'invalid account_id' }, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: { error: @transaction.errors.full_messages.join(',') }, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end

  def transaction_params
    params.fetch(:transaction, {}).permit(:date, :payee, :category, :description, :amount)
  end
end
