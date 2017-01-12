class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @orders = Order.all
    @items = Item.all
    @cart_items = cart.items
  end

  def edit
    @user = User.find(params[:id])
    @cart_items = cart.items
  end

  def update
    @cart_items = cart.items
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_dashboard_index_path
      flash[:success] = "Admin profile successfully updated!"
    else
      flash[:danger] = "Admin profile has NOT been updated!"
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
