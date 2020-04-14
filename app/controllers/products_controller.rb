class ProductsController < ApplicationController
  
  def home
  end

  def index
    @products = Product.all.order(:id)
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
