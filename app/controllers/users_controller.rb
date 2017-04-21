class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_user, only: [:update]

  def show
    user = { id: current_user.id, email: current_user.email }
    render json: user
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    render json: response, status: :created
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
