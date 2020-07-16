class UsersController < ApplicationController
  before_action :authorized, only: [:user, :update, :logout]

  # Sign Up
  def create
    @user = User.new(user_params)
    if @user.save
      @user.accounts.create(name: "main")
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: @user.errors.full_messages.join(",")}
    end
  end

  def update
    if current_user.update(user_params)
      render json: @user
    else
      render json: {error: @user.errors.full_messages.join(",")}, status: :unprocessable_entity
    end
  end

  # Logging in
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id, exp: 24.hours.from_now.to_i})
      render json: {user: @user, token: token}
    else
      render json: {errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def user
    render json: @user
  end

  private
  def user_params
    params.permit(:email, :password, :first_name, :last_name, :phone)
  end

  # def authorize_user
  #   user = User.find(params[:id])
  #   unless (current_user == user)
  #     render json: ["Access denied"], status: :unauthorized
  #   end
  # end
end