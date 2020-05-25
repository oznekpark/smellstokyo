class ProductsController < ApplicationController
  before_action :move_to_home, except: [:home, :index, :indexOfWomenProducts, :indexOfMenProducts, :searchFromHeadersForm, :searchFromPulldownsForm, :show]
  before_action :set_cart
  before_action :set_user

  def home
    @products = Product.last(6)
  end

  def index
    @products = Product.includes(:brand, :main_spice, :season, :sex, :smell_impression, :smell_type, :use_scene).order('created_at DESC')
  end

  def indexOfWomenProducts
    @products = Product.where(sex_id: 1).or(Product.where(sex_id: 3)).includes(:sex).order('created_at DESC')
  end

  def indexOfMenProducts
    @products = Product.where(sex_id: 2).or(Product.where(sex_id: 3)).includes(:sex).order('created_at DESC')
  end

  def searchFromHeadersForm
    @products = Product.search(params[:keyword]).order('created_at DESC')
  end

  def searchFromPulldownsForm
    @products = Product.choose(params[:brand_id], params[:sex_id], params[:smell_type_id], params[:main_spice_id], params[:smell_impression_id], params[:use_scene_id])
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:user).order('created_at DESC')
    @comment = Comment.new
    @related_products = Product.order("RAND()").limit(4).where.not(id: @product.id)
  end

  private
  def move_to_home
    redirect_to action: :home unless user_signed_in?
  end

  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end
