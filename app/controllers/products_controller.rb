class ProductsController < ApplicationController
  
  def home
  end

  def index
    @products = Product.all.order(:id).include(:brand, :main_spice, :season, :sex, :smell_impression, :smell_type, :use_scene, :user)
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
