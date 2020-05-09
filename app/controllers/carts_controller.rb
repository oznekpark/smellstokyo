class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item, :update_item, :delete_item]

  def show
    @line_items = current_cart.line_items
    # @carts = Cart.includes(:product, :line_item)
  end

  def add_item
    @line_item = current_cart.line_items.build(product_id: params[:product_id]) if @line_item.blank?
    @cart_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart
    else
      render current_cart
    end
  end

  def update_item
    @line_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @line_item.destroy
    redirect_to current_cart
  end

  # def new
  #   @cart = Cart.new
  # end

  # def create
  #   @cart = Cart.new(cart_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @cart.update(cart_params)
  #       format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @cart }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @cart.destroy
  #   respond_to do |format|
  #     format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
