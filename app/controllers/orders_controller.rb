class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.where(user_id: current_user.id)
    @orders = @orders.where(id: order_params[:id]) if order_params[:id].present?
    @orders = @orders.cnpj(order_params[:cnpj]) if order_params[:cnpj].present?
    @orders = @orders.map {|order| order.append_products}
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = current_user.orders.create!
    @order.create_products(order_params[:products])
    render json: @order, status: :created
  end

  def update
    # TODO: verificar porque a requisição para atualizar um pedido retorna 404
    if @order.update!(status: order_params[:status])
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
      params.permit(:id, :status, :cnpj, :products => [:id, :quantity])
    end
end
