class SessionsController < ApplicationController
  def new
    @cart_items = cart.items
    redirect_to root_path if current_user != nil
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    session[:user_id] = @user.id
    if @user && @user.authenticate(params[:session][:password]) && current_admin
      redirect_to admin_dashboard_index_path
      flash[:success] = "Admin successfully logged in!"
    elsif @user && @user.authenticate(params[:session][:password])
      redirect_to dashboard_path
      flash[:success] = "Successfully logged in!"
    else
      redirect_to login_path
      flash[:danger] = "Email or password incorrect!"
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:cart)
    redirect_to root_path
  end
end
