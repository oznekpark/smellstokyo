class OrdersController < ApplicationController

  # 管理者向けアクション
  # def index
  #   @orders = Order.order("created_at DESC")
  #   render layout: "application"
  # end

  # def show
  #   @order = Order.find(params[:id])
  #   render layout: "application"
  # end

  #注文入力画面
  def new
    @line_items = current_cart.line_items
    @cart = current_cart
  end

  #注文の登録
  def create
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: "ログインしてください"
      return
    end
    @order = Order.new(order_params)
    if @order.save
      #モデルで定義したメソッドを使用して,単一購入から複数購入できるように変更する記述↓
      OrderDetail.create_items(@order, @line_items)
      # OrderMailer.confirm_mail(@order).deliver
      redirect_to root_path, alert: "注文が正常に登録されました"
    else
      redirect_to root_path, alert: "注文の登録ができませんでした"
    end
  end

  #確認画面
  def confirm
  end
end
