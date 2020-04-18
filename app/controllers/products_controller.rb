class ProductsController < ApplicationController
  
  def home
  end

  def index
    @products = Product.includes(:brand, :main_spice, :season, :sex, :smell_impression, :smell_type, :use_scene).order('created_at DESC')
    
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user).order('created_at DESC')
    @comment = Comment.new
  end

end
