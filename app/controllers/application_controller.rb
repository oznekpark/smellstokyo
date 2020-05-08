class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  private
  #セッションの作成
  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    @current_cart = Cart.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    @current_cart = Cart.create unless @current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = @current_cart.id
    # Cart情報を返却
    @current_cart
  end

  # private
  # def current_cart
  #   Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #   cart = Cart.create
  #   session[:cart_id] = cart.id
  #   cart
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
