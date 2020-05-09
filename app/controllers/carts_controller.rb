class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item, :destroy]

  def show
    @line_items = current_cart.line_items
    @cart = current_cart
  end

  def add_item
    @line_item = current_cart.line_items.build(product_id: params[:product_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart
    else
      redirect_to controller: "products", action: "show"
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    redirect_to current_cart
  end

  private

    def set_line_item
      @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
