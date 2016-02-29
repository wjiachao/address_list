class Admin::SessionsController < Admin::BaseController
  layout false

  def new
  end

  def create
    
    @account = Account.find_by username: params[:username]
    flash[:notice] = "用户名或密码错误，请检查！"

    return render('new') if @account.nil?
    return render('new') unless @account.authenticate(params[:password])
    if !simple_captcha_valid?
      flash[:notice] = "验证码输入有误"
      return render("new")
    end
 
    session[:account_id] = @account.id.to_s
    if params[:remember_me]
      cookies.signed[:account] = {
        value:  @account.encrypt_cookie_value,
        expires: 5.day.from_now.utc
      }
    end
    flash[:notice] = nil
    redirect_to admin_departments_path
  end

  def destroy
    cookies.delete(:account)
    session[:account_id] = nil
    redirect_to [:admin, :login]
  end


end

