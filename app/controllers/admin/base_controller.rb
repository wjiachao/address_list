class Admin::BaseController < ApplicationController
  helper :all
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery 

  def current_admin
    @account ||= Account.find session[:account_id] if session[:account_id]
  end

  def is_login?
    !!session[:account_id]
  end


  private
  def admin_login_required
    redirect_to(admin_login_path) unless is_login?
  end
end