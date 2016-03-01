# 查询公司通讯录接口文档
##环境说明
1. Ruby 2.1.4
2. Rails 4.2


##技术使用说明
1. Bootstrap 页面后台搭建
2. JWT API验证
3. factory-girl, rspec-rails ,guard-rspec, database_cleaner 提供测试支持
4. grape, jbuilder 提供 resetful api

##使用说明
1. 新建database.yml 使用mysql
2. rake db:create / rake db:migrate / rake create_data:sample  提供假数据测试
3. 使用账户名：admin1 密码： 123 登录后台获取密钥


## API列表
1.获取公司通讯录

	地址：app.host/api/campany/employes
	方法：get
   	参数：token (在后台登录后通过左侧获取密钥接口得到)
   	版本号 V1
   	返回：json
  	例如
  		成功返回
	   {
		    "response": {
		        "code": 200,
		        "status": "success"
		    },
		    "data": [
		        {
		            "name": "测试0",
		            "year": 11,
		            "phone": "12121221",
		            "address": "地址",
		            "role": "员工",
		            "department": "技术部"
		        },
		        {
		            "name": "测试1",
		            "year": 11,
		            "phone": "12121221",
		            "address": "地址",
		            "role": "员工",
		            "department": "人事部"
		        },
		        {
		            "name": "测试2",
		            "year": 11,
		            "phone": "12121221",
		            "address": "地址",
		            "role": "员工",
		            "department": "销售部"
		        }
			  ]
			}
			
	   失败返回
	   	{
		    "response": {
		        "code": 401,
		        "status": "unauthorized"
		    }
		}
