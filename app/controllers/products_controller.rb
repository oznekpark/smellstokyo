class ProductsController < ApplicationController
  
  def home
  end

  def index
    @products = Product.includes(:brand, :main_spice, :season, :sex, :smell_impression, :smell_type, :use_scene).order('created_at DESC')
    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, method: :put
    else
      render :edit
    end
  end

  def destroy
  end

  # def search
  #   #Viewのformで取得したパラメータをモデルに渡す
  #   @products = Product.search(params[:search])
  # end

  private

  def product_params
    params.permit(:brand_id, :sex_id, :smell_type_id, :main_spice_id, :smell_impression_id, :use_scene_id)
  end

end
