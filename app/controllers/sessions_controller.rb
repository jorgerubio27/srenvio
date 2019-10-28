class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      # flash.now[:alert] = "Has iniciado sesión correctamente"
      # render "new"
       redirect_to root_url, success: "Has iniciado sesión"
      
    else
      
      redirect_to login_path, danger: "Email o contraseña inválidos"
      # flash[:alert] = "Email o Contraseña inválidos"
      # render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, info: "Has salido correctamente"
  end

end