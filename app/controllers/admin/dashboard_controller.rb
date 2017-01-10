class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @items = Item.all
    @cart_items = cart.items
  end

  def edit
    @user = User.find(params[:id])
    @cart_items = cart.items

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_dashboard_index_path
      flash[:success] = "Admin profile successfully updated!"
    else
      render :edit
      flash[:danger] = "Admin profile has NOT been updated!"
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
