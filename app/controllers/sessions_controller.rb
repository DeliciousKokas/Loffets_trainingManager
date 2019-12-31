class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to user
    else
      flash.now[:danger] = "No"
      render "new"
    end
  end

  def destroy
  end
end
