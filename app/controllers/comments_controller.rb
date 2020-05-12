class CommentsController < ApplicationController
  before_action :set_user

  def create
    comment = Comment.create(comment_params)
    redirect_to "/products/#{comment.product.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :rate).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_user
    @user = User.find(params[:id]) if @user.present? && user_signed_in?
  end
end
