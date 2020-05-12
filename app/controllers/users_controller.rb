class UsersController < ApplicationController
  before_action :set_cart
  
  def show
  end

  def register_card
  end

  def register_address
  end

  private
  def set_cart
    @cart = current_cart
  end
end
