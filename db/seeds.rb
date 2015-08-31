# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "rubygems"
require "json"

uri = URI.parse('http://jsonplaceholder.typicode.com/users')

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

result = JSON.parse(response.body)
	User.delete_all
	result.each do |doc|
		User.create!(doc.slice(:name ['name'], :username ['username'], :email ['email'], :phone ['phone'], :website ['website']))	
	end	

	