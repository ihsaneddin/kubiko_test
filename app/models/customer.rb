class Customer < ActiveRecord::Base

	has_many :credit_charges

	def name
		"#{first_name} #{last_name}"
	end
end
