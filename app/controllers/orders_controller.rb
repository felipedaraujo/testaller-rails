class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = current_user.orders
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = current_user.orders.create!(order_params)
    render json: @order, status: :created
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:status)
    end
end
