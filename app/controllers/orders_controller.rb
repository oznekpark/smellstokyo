class OrdersController < ApplicationController
  before_action :set_cart
  before_action :user_signed_in
  before_action :set_user
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :set_card
  before_action :set_address
  # before_action :authenticate_user! #管理者用

  require "payjp"

  #注文入力画面
  def new
    @line_items = current_cart.line_items
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to current_cart, notice: "カートは空です"
      return
    end
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      default_card_information = customer.cards.retrieve(@card.card_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      @exp_month = default_card_information.exp_month.to_s
      @exp_year = default_card_information.exp_year.to_s.slice(2,3)
      customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "icon_visa.png"
      when "JCB"
        @card_src = "icon_jcb.png"
      when "MasterCard"
        @card_src = "icon_mastercard.png"
      when "American Express"
        @card_src = "icon_amex.png"
      when "Diners Club"
        @card_src = "icon_diners.png"
      when "Discover"
        @card_src = "icon_discover.png"
      end
      @order = Order.new
    end
  end

  #注文の登録(単一購入から複数購入できるように変更)
  def create
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: "ログインしてください"
      return
    end
    @purchaseByCard = Payjp::Charge.create(
    amount: @cart.total_price,
    customer: @card.customer_id,
    currency: 'jpy',
    card: params['payjpToken']
    )
    @order = Order.new(order_params)
    @order.add_items(current_cart)
    if @purchaseByCard.save && @order.save!
      #モデルで定義したメソッドを使用して,単一購入から複数購入できるように変更する記述↓
      OrderDetail.create_items(@order, @cart.line_items)
      # OrderMailer.confirm_mail(@order).deliver
      flash[:notice] = '注文が完了しました'
      redirect_to root_path
    else
      flash[:alert] = "注文の登録ができませんでした"
      redirect_to action: :new
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
    params.permit(:user_id, :address_id, :card_id, :quantity, :price)
  end

  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_cart
    @cart = current_cart
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def user_signed_in
    unless user_signed_in?
      redirect_to cart_path(@cart.id), alert: "レジに進むにはログインが必要です"
    end
  end
end