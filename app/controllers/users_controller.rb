class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hold on to your wallet, you 'bout to get shcammzed"
      session[:user_id] = @user.id # this will remember and keep the user logged in by saving the info in their session cookie
      redirect_to appointments_url
    else
      flash[:alert] = "You dun goofed son! Fix dat chit"
      render :new
    end

  end

  private
  # this mehtod passes in the params from the form to the create method
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
