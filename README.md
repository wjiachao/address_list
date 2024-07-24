# Query company address book interface documentation
## Environment instructions
1. Ruby 2.1.4
2. Rails 4.2

## Technical instructions
1. Bootstrap 
2. JWT API
3. factory-girl, rspec-rails ,guard-rspec, database_cleaner 
4. grape, jbuilder  resetful api

## Usage
1. database.yml  use mysql
2. rake db:create / rake db:migrate / rake create_data:sample  support test data
3. account：admin1 pass： 123  login admin background


## API List

```
1. Get company address

	address：app.host/api/campany/employes
	method：get
   	params：token (After logging in to the background, obtain the key through the left interface.)
   	version V1
   	return：json
  	example
  		success return
	   {
		    "response": {
		        "code": 200,
		        "status": "success"
		    },
		    "data": [
		        {
		            "name": "test0",
		            "year": 11,
		            "phone": "12121221",
		            "address": "ad1",
		            "role": "employee",
		            "department": "tec"
		        },
		        {
		            "name": "test1",
		            "year": 11,
		            "phone": "12121221",
		            "address": "ad12",
		            "role": "employee",
		            "department": "personnel"
		        },
		        {
		            "name": "test2",
		            "year": 11,
		            "phone": "12121221",
		            "address": "ad13",
		            "role": "employee",
		            "department": "sale department"
		        }
			  ]
			}
			
	   failure return
	   	{
		    "response": {
		        "code": 401,
		        "status": "unauthorized"
		    }
		}
```
