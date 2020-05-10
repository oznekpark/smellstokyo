class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]

  #注文入力画面
  def new
    @line_items = current_cart.line_items
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to current_cart, notice: "カートは空です"
      return
    end
    @order = Order.new
  end

  #注文の登録(単一購入から複数購入できるように変更)
  def create
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: "ログインしてください"
      return
    end
    @order = Order.new(order_params)
    @order.add_items(current_cart)
    if @order.save
      #モデルで定義したメソッドを使用して,単一購入から複数購入できるように変更する記述↓
      OrderDetail.create_items(@order, @line_items)
      # OrderMailer.confirm_mail(@order).deliver
      redirect_to root_path, alert: "注文が正常に登録されました"
    else
      redirect_to :new, alert: "注文の登録ができませんでした"
    end
  end

  #確認画面
  def confirm
  end

  # 管理者向けアクション
  # def index
  #   @orders = Order.includes(:product, :user, :order_detail, :address, :card).order("created_at DESC") if user == admin
  #   render layout: "application"
  # end

  # def show
  #   render layout: "application"
  # end

  private
    def order_params
      params.require(:order).permit(:user_id, :address_id, :card_id, :quantity, :product_id)
    end

    def set_order
      @order = Order.find(params[:id])
    end
end
