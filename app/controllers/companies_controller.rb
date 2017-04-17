class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = current_user.companies
    render json: @companies
  end

  def show
    render json: @company
  end

  def create
    @company = current_user.companies.create!(company_params)
    render json: @company, status: :created
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.permit(:name, :cnpj)
    end
end
