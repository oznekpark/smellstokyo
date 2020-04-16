class Products::SearchesController < ApplicationController
  def home
    @products = Product.search(params[:keyword])
  end
  def index
    @products = Product.search(params[:keyword])
  end

  def show
    @products = Product.search(params[:keyword])
  end
end
