class UsersController < ApplicationController
  
  def show
    @user = current_user
    @nickname = current_user.nickname
    @card = Card.where(user_id: current_user.id).first if @card.present?
    @cart = current_cart
    @orders = Order.where(user_id: current_user.id) if @orders.present?
  end

end
