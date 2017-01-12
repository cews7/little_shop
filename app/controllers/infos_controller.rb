class InfosController < ApplicationController
  def new
    @info = Info.new
  end

  def create
    @info = Info.create(info_params)
    if @info.save
      session[:info_id] = @info.id
      redirect_to new_order_path
    else
      redirect_to new_info_path
      flash[:danger] = "Missing or incorrect information, please try again."
    end
  end


  private
  def info_params
    params.require(:info).permit(:name, :address, :city, :state, :postal_code, :country)
  end
end
