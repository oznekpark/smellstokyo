class AddressesController < ApplicationController
  before_action :set_cart
  before_action :set_user
  before_action :set_address, only: [:index, :edit, :update, :destroy]

  def index
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = '住所情報の登録が完了しました'
      redirect_to action: :index
    else
      flash[:alert] = '登録に失敗しました'
      render action: :new
    end
  end

  def edit
  end

  def update
    @address.update(address_params)
    flash[:notice] = '住所情報を更新しました'
    redirect_to action: :index
  end

  def destroy
    @address.destroy
    flash[:notice] = '住所情報を削除しました'
    redirect_to action: :index
  end

  private
  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user
  end

  def address_params
    params.require(:address).permit(:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end
end