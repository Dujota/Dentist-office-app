class Admin::BaseController < ApplicationController
  # this is good to have a common controller for all the Admin modules that can be applied to all aspects of admin

  before_action :require_logged_in
  before_action :require_admin_user

  # check the user that is logged in is a current admin?
  def require_admin_user
    unless current_user.is_admin?
      flash[:alert] = "Sorry, Admins only Biatch! :P"
      redirect_to root_url
    end
  end
end
