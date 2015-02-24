class CreditCharge < ActiveRecord::Base

	belongs_to :customer
	delegate :first_name, :last_name, to: :customer, prefix: true

	THEAD = ['Customer Name', 'Amount', 'Date']

	scope :status, ->(state){ where(define_status(state))}

	def self.define_status type
		cond = nil
		case type.downcase
		when 'failed'
			cond = {paid: true, refunded: true}
		when 'disputed'
			cond = {paid: true, disputed: true}
		when 'successful'
			cond = {paid: true, disputed: false, refunded: false}
		end
		cond
	end
end
