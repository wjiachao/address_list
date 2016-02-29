class Account < ActiveRecord::Base
  has_secure_password
  validates :name, presence: {message: "姓名不能为空"}
  
  validates :password, presence: {message: "密码不能为空"}


end
