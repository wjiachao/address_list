require 'jwt'
class Admin::HomeController < Admin::BaseController
  before_filter :admin_login_required 
  def api_token
    @admin = current_admin
    exp = Time.now.to_i + 3600*24*30
    exp_payload = { :data => @admin.id, :exp => exp }
    @token = JWT.encode(exp_payload, '$2a$10$', 'HS256') 
   
  end
end
