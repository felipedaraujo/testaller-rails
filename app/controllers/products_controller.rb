class ProductsController < ApplicationController
  before_action :set_company
  before_action :set_company_product, only: [:show, :update, :destroy]

  def index
    render json: @company.products
  end

  def show
    render json: @product
  end

  def create
    @product = @company.products.create!(product_params)
    render json: @product, status: :created
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_company_product
      @product = @company.products.find_by!(params[:id]) if @company
    end

    def product_params
      params.permit(:name)
    end
end
