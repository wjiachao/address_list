namespace :create_data do

  desc "创建假数据"
  task :sample => :environment do 
    Account.create(name: 'admin', username: 'admin1', password: '123', password_confirmation: '123') 
    5.times do |i|
      Department.create(name: "部门#{i}")
    end
    10.times do |i|
      Employe.create(name: "测试#{i}", year: '11', role: '员工', phone: '12121221', address: '地址')
    end
  end
end