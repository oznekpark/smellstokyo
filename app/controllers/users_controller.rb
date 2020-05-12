class UsersController < ApplicationController
  before_action :set_cart
  before_action :set_user
  
  def show
    @nickname = current_user.nickname
    @card = Card.where(user_id: current_user.id).first if @card.present?
  end

  def register_card
  end

  def register_address
  end

  private
  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user
  end
end
