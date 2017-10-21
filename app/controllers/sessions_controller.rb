class SessionsController < ApplicationController

  def destroy
    # session[:user_id] = nil  to log the user out, which clears the cookie
    session.clear
    redirect_to root_url
  end

  def new
    # this stays empty becuase we are only showing the login form
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to appointments_url
    else
      flash[:alert] = "Email or Password Incorrect"
      render :new
    end

  end

end
