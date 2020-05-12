class AddressesController < ApplicationController
  before_action :set_cart

  private
  def set_cart
    @cart = current_cart
  end
end
