class UsersController < ApplicationController

  def new
    @cart_items = cart.items
    @user = User.new
  end

  def create
    @cart_items = cart.items
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:success] = "#{@user.name} successfully created!"
    else
      redirect_to new_user_path
      flash[:danger] = "Missing needed credentials or passwords do not match!"
    end
  end

  def show
    @cart_items = cart.items
    
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
