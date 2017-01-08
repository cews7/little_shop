class SessionsController < ApplicationController
  def new
    @cart_items = cart.items
    redirect_to root_path if current_user != nil
  end

  def create
    @cart_items = cart.items
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
      flash[:success] = "Successfully logged in!"
    else
      redirect_to login_path
      flash[:danger] = "Email or password incorrect!"
    end
  end

  def destroy
    session.delete(:user_id)
    
    redirect_to root_path
  end
end
