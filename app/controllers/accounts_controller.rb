class AccountsController < ApplicationController

  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = current_user.accounts
    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: { error: @account.errors.full_messages.join(",") }, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: {error: @account.errors.full_messages.join(",")}, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.fetch(:account, {}).permit(:name, :initial_balance)
    end
end