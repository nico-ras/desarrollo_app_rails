class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email]) #identificamos al usuario
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logeado Correctamente"
    else
      flash.now[:notice] = 'Email o Password invalida'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'signed out successfully'
  end
end
