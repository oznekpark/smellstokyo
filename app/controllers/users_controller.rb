class UsersController < ApplicationControllerdef 
  
  def show
    @nickname = current_user.nickname
    @products = current_user.product
  end

end
