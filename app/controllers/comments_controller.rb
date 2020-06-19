class CommentsController < ApplicationController
  before_action :set_user

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to product_path(@comment.product.id)}
        format.json
      end
    else
      @product = Product.find(params[:id])
      @comments = @product.comments.includes(:user).order('created_at DESC')
      render controller: :products, action: :show, id: @product.id
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :rate).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_user
    @user = User.find(params[:id]) if @user.present? && user_signed_in?
  end
end
