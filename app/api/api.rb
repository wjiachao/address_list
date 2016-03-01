require 'jwt'
class API < Grape::API
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
    def check_token       
      p params['token']     
      decode = JWT.decode(params["token"], '$2a$10$', true, { :algorithm => 'HS256' }) rescue nil
      p decode
      decode_id = decode[0]['data'].to_i  rescue nil
      user = Account.find(decode_id) rescue nil
      if user.present? && params["token"] && params["token"] != ""
        true                   
      else                     
        false                  
      end                      
    end
  end

  resource :campany do
    desc 'get data'
    params do
      requires :token, type: String, desc: 'auth token'
    end
    get 'employes', jbuilder: 'employes.jbuilder' do
      if check_token
        @employes = Employe.all
      else
        env['api.tilt.template'] = 'unauth.jbuilder'
      end
    
    end
  end




end
