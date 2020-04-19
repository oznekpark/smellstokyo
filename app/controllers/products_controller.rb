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

  def searchFromHeadersForm
    @products = Product.search(params[:keyword])
  end

  def searchFromPulldownsForm
    @products = Product.get_sex_id(params[:sex_id])
    # @products = Product.get_brand_id(params[:brand_id])
    # @products = Product.get_brand_id(params[:brand_id]).get_sex_id(params[:sex_id]).get_smell_type_id(params[:smell_type_id]).get_main_spice_id(params[:main_spice_id]).get_smell_impression_id(params[:smell_impression_id]).get_use_scene_id(params[:use_scene_id])
  end

end
