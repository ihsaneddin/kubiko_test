# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#seeds customer data

ActiveRecord::Base.connection.execute('truncate table customers')
Customer.create [
				 {first_name: 'Johny', last_name: 'Flow'},
				 {first_name: 'Raj', last_name: 'Jamnis'},
				 {first_name: 'Andrew', last_name: 'Chung'},
				 {first_name: 'Mike', last_name: 'Smith'}
				]
customer1,customer2,customer3,customer4 = Customer.all

date = Date.today

#seed transaction data

ActiveRecord::Base.connection.execute('truncate table credit_charges')

#successful transaction

5.times do |i|
	customer1.credit_charges.build paid: true, amount: 100*(i+1), currency: 'usd', refunded: false, disputed: false, created: (date-i.week).to_time.to_i
end

3.times do |i|
	customer2.credit_charges.build paid: true, amount: 200*(i+1), currency: 'usd', refunded: false, disputed: false, created: (date-i.day).to_time.to_i
end

customer3.credit_charges.build paid: true, amount: 300, currency: 'usd', refunded: false, disputed: false, created: (date-3.day).to_time.to_i
customer4.credit_charges.build paid: true, amount: 400, currency: 'usd', refunded: false, disputed: false, created: (date-1.week).to_time.to_i

#failed transaction

3.times do |i|
	customer3.credit_charges.build paid: true, amount: 500*(i+1), currency: 'usd', refunded: true, disputed: false, created: (date-i.day).to_time.to_i
end

2.times do |i|
	customer2.credit_charges.build paid: true, refunded: true, amount: 300*(i+1), currency: 'usd', disputed: false, created: (date-i.week).to_time.to_i
end

# disputed transaction

3.times do |i|
	customer1.credit_charges.build paid: true, amount: 500*(i+2), currency: 'usd', refunded: false, disputed: true, created: (date-i.day).to_time.to_i	
end

2.times do |i|
	customer2.credit_charges.build paid: true, amount: 1000*(i+1), currency: 'usd', refunded: false, disputed: true, created: (date-i.day).to_time.to_i
end

customer1.save
customer2.save
customer3.save
customer4.save