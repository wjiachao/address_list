json.response do 
  json.code 200
  json.status "success"
end
json.data @employes do |employe|
  json.name employe.name
  json.year employe.year
  json.phone employe.phone
  json.address employe.address
  json.role employe.role
  if employe.department.try(:name).nil?
    json.department ''
  else
    json.department employe.department.name
  end
end