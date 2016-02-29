class API < Grape::API
  # version 'v1', using: :path
  # format :json
  prefix :api
  format :json
  formatter :json, Grape::Formatter::Jbuilder
  if Rails.env.production?
    use ExceptionNotification::Rack 
    rescue_from :all do |e|
     Rack::Response.new({
        response: {status: 'failed', error_code: 99}
        }.to_json).finish
    end
  end

  helpers do  
    # include SimpleCaptcha::ControllerHelpers
    def session
      env[Rack::Session::Abstract::ENV_SESSION_KEY]
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end


  resource :get do
    get '', jbuilder: 'hello/index.jbuilder' do
    
    end
  end




end
