require "rails_helper"
describe "AccountsController"  do
  let(:account) {create :account}
  before :each do
    exp = Time.now.to_i + 3600*24*30
    exp_payload = { :data => account.id, :exp => exp }
    @token = JWT.encode(exp_payload, '$2a$10$', 'HS256') 
   
  end
  
  context "#create" do
    it "when success" do
     expect(account.name).to eq("wjc")
    end
  end
  


  context "#auth admin" do
    it "when success" do
      get '/api/campany/employes', { token: 'test'} 
      expect(JSON.parse(response.body)['response']['status']).to eql "unauthorized"
    end

    it "when fail" do 
      get '/api/campany/employes', { token: @token} 
      expect(JSON.parse(response.body)['response']['status']).to eql "success"
    end
  end
end