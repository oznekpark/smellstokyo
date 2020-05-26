class BookmarksController < ApplicationController
  before_action :set_cart
  before_action :set_user

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id).includes(:user, :product).order(id: :DESC)
  end

  def create
    bookmark = current_user.bookmarks.build(product_id: params[:product_id])
    product = Product.find(params[:product_id])
    bookmark.save!
    redirect_to controller: :products, action: :show, id: product.id
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(product_id: params[:product_id])
    product = Product.find(params[:product_id])
    bookmark.destroy!
    redirect_to controller: :products, action: :show, id: product.id
  end

  def delete
    bookmark = Bookmark.find_by(product_id: params[:product_id])
    bookmark.destroy!
    redirect_to action: :index
  end

  private
  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end
